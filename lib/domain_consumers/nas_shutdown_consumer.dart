import 'dart:async';

import 'package:iot_models/iot_models.dart';
import 'package:nas_shutdown_client/domain/iot_devices/iot_devices_bloc.dart';
import 'package:nas_shutdown_client/internal/runnable.dart';
import 'package:nas_shutdown_client/services/ssh/ssh_shutdowner.dart';
import 'package:rxdart/rxdart.dart';

class NasShutDownConsumer implements Runnable {
  NasShutDownConsumer({
    required final this.iotDevicesBloc,
    required final this.sshShutdowner,
    final this.bufferMeasureData = 10,
    final this.voltageShutdown = 9.1,
    final this.durationDelayShutdown = const Duration(hours: 1),
  });

  final IotDevicesBloc iotDevicesBloc;
  final SshShutdowner sshShutdowner;
  final int bufferMeasureData;
  final double voltageShutdown;
  final Duration durationDelayShutdown;

  late final StreamSubscription _subBlocUpdateState;
  late final StreamSubscription _subBlocErrorState;
  Timer? _timerDelayShutdown;

  @override
  void run() {
    _subscribeErrors();
    _subscribeUpdates();
  }

  void _subscribeUpdates() {
    _subBlocUpdateState = iotDevicesBloc.stream
        .where((final state) => state is Update)
        .map(
          (final state) => state.whenOrNull(
            update: (final devices) => devices,
          )!,
        )
        .whereType<IotDevicesDataWrapper>()
        .flatMap((final devices) => Stream.fromIterable(devices.devices))
        .where((final device) => device.typeDevice == TypeDevice.ups)
        .where((final device) => device.data != null)
        .map((final device) => device.data as UpsData)
        .map((final upsData) => upsData.voltageDC)
        .bufferCount(bufferMeasureData)
        .map(
          (final voltages) =>
              voltages.reduce((final value, final element) => value + element) /
              voltages.length,
        )
        .listen((final voltageAvg) {
      if (voltageAvg <= voltageShutdown && _timerDelayShutdown == null) {
        _runTimerDelayShutdown();
        print('LOW voltage $voltageAvg');
        sshShutdowner.run().then<void>((_) => sshShutdowner.execute());
      }
    });
    iotDevicesBloc.add(const IotDevicesEvent.start());
  }

  void _subscribeErrors() {
    _subBlocErrorState = iotDevicesBloc.stream
        .where((final state) => state is ErrorConnection)
        .listen(
      (final state) {
        _subBlocUpdateState.cancel();
        _subBlocErrorState.cancel();
      },
    );
  }

  void _runTimerDelayShutdown() =>
      _timerDelayShutdown = Timer(durationDelayShutdown, () {
        _timerDelayShutdown = null;
      });
}
