import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nas_shutdown_client/models/client.dart';
import 'package:nas_shutdown_client/models/control_data.dart';
import 'package:nas_shutdown_client/models/iot_devices_data_wrapper.dart';
import 'package:nas_shutdown_client/services/iot_communicator/iot_communicator_service.dart';

part 'iot_devices_bloc.freezed.dart';

@freezed
abstract class IotDevicesEvent with _$IotDevicesEvent {
  const factory IotDevicesEvent.start() = Start;

  const factory IotDevicesEvent.controlDevice(
    final ControlData controlData,
  ) = ControlDevice;

  const factory IotDevicesEvent.innerIotDevicesUpdate(
    final IotDevicesDataWrapper iotDevicesDataWrapper,
  ) = InnerIotDevicesUpdate;
}

@freezed
abstract class IotDevicesState with _$IotDevicesState {
  const factory IotDevicesState.initial() = Initial;

  const factory IotDevicesState.loading() = Loading;

  const factory IotDevicesState.update(
    final IotDevicesDataWrapper iotDevicesDataWrapper,
  ) = Update;

  const factory IotDevicesState.error(final String error) = Error;
}

class IotDevicesBloc extends Bloc<IotDevicesEvent, IotDevicesState> {
  IotDevicesBloc(this.iotCommunicatorService) : super(const Initial()) {
    on<IotDevicesEvent>(
      (final event, final emit) => event.when(
        start: () => _start(emit),
        innerIotDevicesUpdate: (final iotDevicesDataWrapper) =>
            _innerIotDevicesUpdate(
          iotDevicesDataWrapper,
          emit,
        ),
        controlDevice: (final controlData) => _controlDevice(
          controlData,
          emit,
        ),
      ),
    );
  }

  final IotCommunicatorService iotCommunicatorService;
  late final StreamSubscription _subIotDevices;

  Future<void> _start(
    final Emitter<IotDevicesState> emit,
  ) async {
    emit(const IotDevicesState.loading());

    _subIotDevices = iotCommunicatorService.watchIotDevicesModel().listen(
          (final iotDevices) => add(
            IotDevicesEvent.innerIotDevicesUpdate(iotDevices),
          ),
        );
  }

  Future<void> _innerIotDevicesUpdate(
    final IotDevicesDataWrapper iotDevicesDataWrapper,
    final Emitter<IotDevicesState> emit,
  ) async {
    emit(IotDevicesState.update(iotDevicesDataWrapper));
  }

  Future<void> _controlDevice(
    final ControlData controlData,
    final Emitter<IotDevicesState> emit,
  ) async {
    iotCommunicatorService.sendClient(Client(controlData: controlData));
  }

  @override
  Future<void> close() async {
    await _subIotDevices.cancel();
    return super.close();
  }
}
