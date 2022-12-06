import 'package:dartssh2/dartssh2.dart';
import 'package:nas_shutdown_client/services/ssh/ssh_shutdowner.dart';

class SshRunnerImpl implements SshShutdowner {
  SshRunnerImpl({
    required final this.ip,
    required final this.port,
    required final this.username,
    required final this.password,
  });

  final String ip;
  final int port;
  final String username;
  final String password;

  late final SSHClient _sshClient;

  @override
  Future<void> execute() async {
    await _sshClient.run('echo $password | sudo -S shutdown -h');
  }

  @override
  Future<void> run() async {
    final sshSocket = await SSHSocket.connect(ip, port);

    _sshClient = SSHClient(
      sshSocket,
      username: username,
      onPasswordRequest: () => password,
    );
  }
}
