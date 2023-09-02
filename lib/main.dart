import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';
import 'package:nas_shutdown_client/di/config_consumers.dart';
import 'package:nas_shutdown_client/di/static_dependencies.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();

  final channelProvider = await configChannelProvider(
    ipClients: ipClients,
    portClients: portClients.toString(),
    cryptoClients: cryptoClients,
  );
  final iotCommunicatorService = await configCommunicator(channelProvider);
  final authBloc = await configAuthBloc(iotCommunicatorService, nameDevice);

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
