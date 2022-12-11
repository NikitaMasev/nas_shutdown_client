import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:iot_internal/iot_internal.dart';
import 'package:nas_shutdown_client/di/consumers.dart';
import 'package:nas_shutdown_client/di/domains.dart';
import 'package:nas_shutdown_client/di/sources.dart';
import 'package:nas_shutdown_client/domain/auth/auth_bloc.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();

  final iotCommunicatorService = await configCommunicator();
  final authBloc = await configAuthBloc(iotCommunicatorService);

  authBloc.stream.listen(
    (final state) => state.whenOrNull(
      success: () {
        configNasShutdownConsumer(iotCommunicatorService).then<void>(
          (final shutDowner) => shutDowner.run(),
        );
      },
      errorConnection: () {
        authBloc.add(const AuthEvent.start());
      },
    ),
  );
  authBloc.add(const AuthEvent.start());
}
