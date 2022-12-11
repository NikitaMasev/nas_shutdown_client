import 'package:iot_internal/iot_internal.dart';

abstract class SshShutdowner implements RunnableAsync {
  Future<void> execute();
}
