import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'iot_devices_bloc.freezed.dart';

@freezed
abstract class IotDevicesEvent with _$IotDevicesEvent {
  const factory IotDevicesEvent.start(final String token) = Start;
}

@freezed
abstract class IotDevicesState with _$IotDevicesState {

  const factory IotDevicesState.initial() = Initial;

  const factory IotDevicesState.loading() = Loading;

  const factory IotDevicesState.success(final String data) = Success;

  const factory IotDevicesState.error(final String error) = Error;

}

class IotDevicesBloc extends Bloc<IotDevicesEvent, IotDevicesState> {
  IotDevicesBloc() : super(const Initial()) {
    on<IotDevicesEvent>(
      (final event, final emit) => event.when(
        start: (final token) => _start(token, emit),
      ),
    );
  }

  Future<void> _start(
    final String token,
    final Emitter<IotDevicesState> emit,
  ) async {

  }
}
