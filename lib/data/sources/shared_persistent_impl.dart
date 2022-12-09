import 'dart:convert';

import 'package:nas_shutdown_client/data/sources/shared_persistent.dart';
import 'package:iot_models/iot_models.dart';

const _user = 'user';

class SharedPersistentImpl implements SharedPersistent {
  SharedPersistentImpl();

  @override
  Future<Client?> getSavedClient() async {
/*    final rawData = shared.getString(_user);
    if (rawData != null) {
      final map = jsonDecode(rawData);
      return Client.fromJson(map as Map<String, dynamic>);
    }*/
    return null;
  }

  @override
  Future<void> saveClient(final Client? client) async {
/*    if (client == null) {
      await shared.remove(_user);
    } else {
      final jsonEncoded = jsonEncode(client.toJson());
      await shared.setString(_user, jsonEncoded);
    }*/
  }
}
