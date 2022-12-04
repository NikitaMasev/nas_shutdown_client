import 'package:nas_shutdown_client/data/repositories/user_repository.dart';
import 'package:nas_shutdown_client/data/sources/shared_persistent.dart';
import 'package:nas_shutdown_client/models/client.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.sharedPersistent);

  final SharedPersistent sharedPersistent;

  @override
  Future<Client?> getClient() => sharedPersistent.getSavedClient();

  @override
  Future<void> removeClient() => sharedPersistent.saveClient(null);

  @override
  Future<void> saveClient(final Client client) =>
      sharedPersistent.saveClient(client);
}
