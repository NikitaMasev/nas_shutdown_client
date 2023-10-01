import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';
import 'package:nas_shutdown_client/di/config_consumers.dart';
import 'package:nas_shutdown_client/di/static_dependencies.dart';
import 'package:sentry/sentry.dart';

Future<void> main() async {
  await Sentry.init((final options) {
    options.dsn = 'https://641f8168de5947975bbc45ecebbdbdb1@o4505974572318720.ingest.sentry.io/4505974647357440';
    options.tracesSampleRate = 1.0;
  });
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
    },
    (final error, final stack) async {
      print(
      '${error.toString()} Stacktrace: ${stack.toString()}',
    );
      await Sentry.captureException(
        error,
        stackTrace: stack,
      );
    },
  );
}
