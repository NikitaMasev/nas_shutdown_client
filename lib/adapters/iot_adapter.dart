import 'package:nas_shutdown_client/models/client.dart';
import 'package:nas_shutdown_client/models/communicator_sign.dart';
import 'package:nas_shutdown_client/models/iot_devices_data_wrapper.dart';

abstract class IotAdapter {
  String encodeClient(final Client client);

  Client decodeClient(final String data);

  IotDevicesDataWrapper decodeIotDevices(final String data);

  Sign partiallyDecodeSign(final String data);
}
