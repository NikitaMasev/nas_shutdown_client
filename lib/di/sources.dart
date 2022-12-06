import 'package:nas_shutdown_client/adapters/iot_adapter_impl.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

Future<IotCommunicatorService> configCommunicator() async {
  final iotChannelProvider = await _configChannelProvider();
  const iotAdapter = IotAdapterImpl();
  return IotCommunicatorServiceImpl(
    iotChannelProvider: iotChannelProvider,
    iotAdapter: iotAdapter,
  );
}

Future<SharedPersistent> _configSharedPersistent() async {
  final shared = await SharedPreferences.getInstance();
  return SharedPersistentImpl(shared);
}

Future<UserRepository> configUserRepo() async {
  final sharedPersistent = await _configSharedPersistent();
  return UserRepositoryImpl(sharedPersistent);
}

Future<IotChannelProvider> _configChannelProvider() async {
  final iotChannelProvider = IotServiceConnector(
    ip: ipClients,
    port: portClients.toString(),
  );
  return IotServiceCryptoConnector(
    iotChannelProvider: iotChannelProvider,
    crypto: cryptoClients,
  );
}
