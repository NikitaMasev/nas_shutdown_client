import 'package:nas_shutdown_client/di/domains.dart';
import 'package:nas_shutdown_client/di/services.dart';
import 'package:nas_shutdown_client/domain_consumers/nas_shutdown_consumer.dart';
import 'package:nas_shutdown_client/internal/runnable.dart';
import 'package:nas_shutdown_client/services/iot_communicator/iot_communicator_service.dart';

Future<Runnable> configNasShutdownConsumer(
    final IotCommunicatorService iotCommunicatorService,
    ) async {
  final iotDevicesBloc = await configIotDevicesBloc(iotCommunicatorService);
  final sshShutdowner = await configSshShutdowner();
  return NasShutDownConsumer(
    iotDevicesBloc: iotDevicesBloc,
    sshShutdowner: sshShutdowner,
  );
}
