import 'package:nas_shutdown_client/internal/runnable_async.dart';

abstract class SshShutdowner implements RunnableAsync {
  Future<void> execute();
}
