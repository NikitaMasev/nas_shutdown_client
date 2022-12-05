import 'package:nas_shutdown_client/models/client.dart';
import 'package:nas_shutdown_client/models/iot_devices_data_wrapper.dart';

abstract class IotCommunicatorService {
  void sendClient(final Client client);

  Stream<Client> watchClientModel();

  Stream<IotDevicesDataWrapper> watchIotDevicesModel();
}
