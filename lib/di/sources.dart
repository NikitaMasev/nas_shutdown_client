import 'package:iot_internal/iot_internal.dart';
import 'package:iot_models/iot_models.dart';
import 'package:nas_shutdown_client/data/repositories/user_repository.dart';
import 'package:nas_shutdown_client/data/repositories/user_repository_impl.dart';
import 'package:nas_shutdown_client/data/sources/shared_persistent.dart';
import 'package:nas_shutdown_client/data/sources/shared_persistent_impl.dart';
import 'package:nas_shutdown_client/di/static_dependencies.dart';
import 'package:nas_shutdown_client/services/iot_communicator/iot_communicator_service.dart';
import 'package:nas_shutdown_client/services/iot_communicator/iot_communicator_service_impl.dart';
import 'package:nas_shutdown_client/services/iot_connector/iot_channel_provider.dart';
import 'package:nas_shutdown_client/services/iot_connector/iot_service_connector.dart';
import 'package:nas_shutdown_client/services/iot_connector/iot_service_crypto_connector.dart';

Future<IotCommunicatorService> configCommunicator() async {
  final iotChannelProvider = await _configChannelProvider();

  return IotCommunicatorServiceImpl(
    iotChannelProvider: iotChannelProvider,
    communicatorSignDecoder: const CommunicatorSignDecoderImpl(),
    iotDevicesCodec: const IotDevicesCodecImpl(),
    clientCodec: const ClientCodecImpl(),
  );
}

Future<SharedPersistent> _configSharedPersistent() async =>
    SharedPersistentImpl();

Future<UserRepository> configUserRepo() async {
  final sharedPersistent = await _configSharedPersistent();
  return UserRepositoryImpl(sharedPersistent);
}

Future<IotChannelProvider> _configChannelProvider() async {
  final iotChannelProvider = IotServiceConnector(
    ip: ipClients,
    port: portClients.toString(),
  )..run();
  return IotServiceCryptoConnector(
    iotChannelProvider: iotChannelProvider,
    crypto: cryptoClients,
  );
}
