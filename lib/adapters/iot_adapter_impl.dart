import 'dart:convert';

import 'package:nas_shutdown_client/adapters/iot_adapter.dart';
import 'package:nas_shutdown_client/models/client.dart';
import 'package:nas_shutdown_client/models/communicator_sign.dart';
import 'package:nas_shutdown_client/models/iot_devices_data_wrapper.dart';

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
  Sign partiallyDecodeSign(final String data) {
    if (!data.contains('sign')) {
      return Sign.unknown;
    }
    final json = jsonDecode(data);
    final communicatorSign = CommunicatorSign.fromJson(
      json as Map<String, dynamic>,
    );
    return communicatorSign.sign;
  }
}
