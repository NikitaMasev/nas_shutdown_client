import 'dart:async';

import 'package:nas_shutdown_client/di/consumers.dart';
import 'package:nas_shutdown_client/di/domains.dart';
import 'package:nas_shutdown_client/di/sources.dart';
import 'package:nas_shutdown_client/domain/auth/auth_bloc.dart';

Future<void> main() async {
  final iotCommunicatorService = await configCommunicator();
  final authBloc = await configAuthBloc(iotCommunicatorService);

  late final StreamSubscription subAuth;

  subAuth = authBloc.stream.listen(
    (final state) => state.whenOrNull(
      success: () {
        subAuth.cancel();
        configNasShutdownConsumer(iotCommunicatorService).then<void>(
          (final shutDowner) => shutDowner.run(),
        );
      },
    ),
  );
  authBloc.add(const AuthEvent.start());
}
