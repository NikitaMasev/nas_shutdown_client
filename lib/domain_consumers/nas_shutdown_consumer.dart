import 'dart:async';

import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';
import 'package:iot_models/iot_models.dart';
import 'package:nas_shutdown_client/services/ssh/ssh_shutdowner.dart';
import 'package:rxdart/rxdart.dart';

class NasShutDownConsumer implements Runnable {
  NasShutDownConsumer({
    required this.iotDevicesBloc,
    required this.sshShutdowner,
    required this.targetId,
    this.bufferMeasureData = 10,
    this.voltageShutdown = 9.1,
    this.durationDelayShutdown = const Duration(minutes: 10),
  });

  final IotDevicesBloc iotDevicesBloc;
  final SshShutdowner sshShutdowner;
  final int bufferMeasureData;
  final double voltageShutdown;
  final Duration durationDelayShutdown;
  final int targetId;

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
        .where((final device) => device.id == targetId)
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
