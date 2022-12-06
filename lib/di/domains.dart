import 'package:nas_shutdown_client/di/sources.dart';
import 'package:nas_shutdown_client/di/static_dependencies.dart';
import 'package:nas_shutdown_client/domain/auth/auth_bloc.dart';
import 'package:nas_shutdown_client/domain/iot_devices/iot_devices_bloc.dart';
import 'package:nas_shutdown_client/services/iot_communicator/iot_communicator_service.dart';

Future<AuthBloc> configAuthBloc(
  final IotCommunicatorService iotCommunicatorService,
) async {
  final userRepository = await configUserRepo();
  return AuthBloc(
    userRepository: userRepository,
    iotCommunicatorService: iotCommunicatorService,
    name: nameDevice,
  );
}

Future<IotDevicesBloc> configIotDevicesBloc(
  final IotCommunicatorService iotCommunicatorService,
) async =>
    IotDevicesBloc(iotCommunicatorService);
