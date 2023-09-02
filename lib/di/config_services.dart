import 'package:nas_shutdown_client/di/static_dependencies.dart';
import 'package:nas_shutdown_client/services/ssh/ssh_runner_impl.dart';
import 'package:nas_shutdown_client/services/ssh/ssh_shutdowner.dart';

Future<SshShutdowner> configSshShutdowner() async => SshRunnerImpl(
      ip: ipNas,
      port: portNas,
      username: usernameNas,
      password: passwordNas,
    );
