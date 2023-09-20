import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';
import 'package:nas_shutdown_client/di/config_services.dart';
import 'package:nas_shutdown_client/di/static_dependencies.dart';
import 'package:nas_shutdown_client/domain_consumers/nas_shutdown_consumer.dart';

Future<Runnable> configNasShutdownConsumer(
  final IotCommunicatorService iotCommunicatorService,
) async {
  final iotDevicesBloc = await configIotDevicesBloc(iotCommunicatorService);
  final sshShutDowner = await configSshShutdowner();
  return NasShutDownConsumer(
    iotDevicesBloc: iotDevicesBloc,
    sshShutdowner: sshShutDowner,
    targetId: targetId,
  );
}
