import 'package:nas_shutdown_client/models/client.dart';

abstract class UserRepository {
  Future<Client?> getClient();

  Future<void> saveClient(final Client client);

  Future<void> removeClient();
}
