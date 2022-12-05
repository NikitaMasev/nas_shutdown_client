import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nas_shutdown_client/data/repositories/user_repository.dart';
import 'package:nas_shutdown_client/services/iot_communicator/iot_communicator_service.dart';

part 'auth_bloc.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.start(final String name) = Start;
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
  }) : super(const Initial()) {
    on<AuthEvent>(
      (final event, final emit) => event.when(
        start: (final name) => _start(name, emit),
      ),
    );
  }

  final UserRepository userRepository;
  final IotCommunicatorService iotCommunicatorService;

  Future<void> _start(
    final String name,
    final Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final user = await userRepository.getClient();

    if (user == null) {
      await _register(name, emit);
    }
  }

  Future<void> _register(
    final String name,
    final Emitter<AuthState> emit,
  ) async {}
}
