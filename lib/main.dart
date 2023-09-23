import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';
import 'package:nas_shutdown_client/di/config_consumers.dart';
import 'package:nas_shutdown_client/di/static_dependencies.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      Bloc.observer = AppBlocObserver();

      final (channelProvider, channelStateWatcher, runner) =
          await configChannelProvider(
        ipClients: ipClients,
        portClients: portClients.toString(),
        cryptoClients: cryptoClients,
      );

      final iotCommunicatorService = await configCommunicator(channelProvider);
      final authBloc = await configAuthBloc(
        iotCommunicatorService: iotCommunicatorService,
        channelStateWatcher: channelStateWatcher,
        nameDevice: nameDevice,
      );

      authBloc.stream.listen(
        (final state) => state.whenOrNull(
          success: () {
            configNasShutdownConsumer(iotCommunicatorService).then<void>(
              (final shutDowner) => shutDowner.run(),
            );
          },
        ),
      );
      authBloc.add(const AuthEvent.start());
      runner.run();
      return null;
    },
    (final error, final stack) => print(
      '${error.toString()} Stacktrace: ${stack.toString()}',
    ),
  );
}
