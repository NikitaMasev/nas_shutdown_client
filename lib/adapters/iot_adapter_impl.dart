import 'dart:convert';

import 'package:nas_shutdown_client/adapters/iot_adapter.dart';
import 'package:iot_models/iot_models.dart';

class IotAdapterImpl implements IotAdapter {
  const IotAdapterImpl();

  @override
  String encodeClient(final Client client) {
    final mapJson = client.toJson();
    return jsonEncode(mapJson);
  }

  @override
  Client decodeClient(final String data) {
    final json = jsonDecode(data);
    return Client.fromJson(json as Map<String, dynamic>);
  }

  @override
  IotDevicesDataWrapper decodeIotDevices(final String data) {
    final json = jsonDecode(data);
    return IotDevicesDataWrapper.fromJson(json as Map<String, dynamic>);
  }

  @override
  Sign decodeSign(final String data) => partiallyDecodeSign(data);
}
