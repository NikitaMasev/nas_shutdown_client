import 'package:nas_shutdown_client/models/client.dart';

abstract class SharedPersistent {
  Future<Client?> getSavedClient();

  Future<void> saveClient(final Client? client);
}
