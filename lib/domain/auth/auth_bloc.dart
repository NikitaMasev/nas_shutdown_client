import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nas_shutdown_client/data/repositories/user_repository.dart';
import 'package:nas_shutdown_client/models/client.dart';
import 'package:nas_shutdown_client/models/iot_devices_data_wrapper.dart';
import 'package:nas_shutdown_client/services/iot_communicator/iot_communicator_service.dart';

part 'auth_bloc.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.start() = Start;

  const factory AuthEvent.innerClientUpdate(
    final Client client,
  ) = InnerClientUpdate;
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;

  const factory AuthState.loading() = Loading;

  const factory AuthState.success() = Success;

  const factory AuthState.error(final String error) = Error;
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required final this.userRepository,
    required final this.iotCommunicatorService,
    required final this.name,
  }) : super(const Initial()) {
    on<AuthEvent>(
      (final event, final emit) => event.when(
        start: () => _start(emit),
        innerClientUpdate: (final client) => _innerClientUpdate(
          client,
          emit,
        ),
      ),
    );
  }

  final UserRepository userRepository;
  final IotCommunicatorService iotCommunicatorService;
  final String name;
  late final StreamSubscription _subClient;

  Future<void> _start(
    final Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    _subscribeClient();

    final client = await userRepository.getClient();

    ///register process
    if (client == null) {
      iotCommunicatorService.sendClient(Client(name: name));
    } else {
      ///auth process
      iotCommunicatorService.sendClient(client);
    }
  }

  Future<void> _innerClientUpdate(
    final Client client,
    final Emitter<AuthState> emit,
  ) async {
    if (client.nonValid) {
      emit(const AuthState.error('client not valid'));
      return;
    }

    ///auth process success
    if (client.id != null && client.name != null) {
      emit(const AuthState.success());
    } else if (client.id != null) {
      ///register process success
      final fullClient = Client(id: client.id, name: name);

      await userRepository.saveClient(fullClient);

      ///auth process
      iotCommunicatorService.sendClient(fullClient);
    }
  }

  void _subscribeClient() =>
      _subClient = iotCommunicatorService.watchClientModel().listen(
            (final client) => add(
              AuthEvent.innerClientUpdate(client),
            ),
          );

  @override
  Future<void> close() async {
    await _subClient.cancel();
    return super.close();
  }
}
