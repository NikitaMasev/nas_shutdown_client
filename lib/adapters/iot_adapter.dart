import 'package:iot_models/iot_models.dart';

abstract class IotAdapter {
  String encodeClient(final Client client);

  Client decodeClient(final String data);

  IotDevicesDataWrapper decodeIotDevices(final String data);

  Sign decodeSign(final String data);
}
