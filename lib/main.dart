import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:nas_shutdown_client/di/consumers.dart';
import 'package:nas_shutdown_client/di/domains.dart';
import 'package:nas_shutdown_client/di/sources.dart';
import 'package:nas_shutdown_client/domain/auth/auth_bloc.dart';
import 'package:nas_shutdown_client/internal/app_bloc_observer.dart';

///TODO retry auth after lost power, connection;
///TODO try to make other iot_device_data_converter.dart;
Future<void> main() async {
  Bloc.observer = AppBlocObserver();

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
