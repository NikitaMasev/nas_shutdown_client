import 'dart:async';

import 'package:dartssh2/dartssh2.dart';
import 'package:nas_shutdown_client/internal/runnable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:socket_server/services/iot_services/data_notifyer/iot_streamer.dart';

const _lowVoltage = 9.1;

class NasUpsShutDown implements Runnable {
  NasUpsShutDown({
    required final this.iotStreamer,
    required final this.ip,
    required final this.port,
    required final this.username,
    required final this.password,
  });

  final IotStreamer iotStreamer;
  final String ip;
  final int port;
  final String username;
  final String password;

  StreamSubscription? _subIot;

  Future<void> _runSshShutDown() async {
    final sshSocket = await SSHSocket.connect(ip, port);

    final clientSsh = SSHClient(
      sshSocket,
      username: username,
      onPasswordRequest: () => password,
    );
    //-h
    await clientSsh.run('echo $password | sudo -S shutdown -h');
  }

  @override
  void run() {
    _subIot = iotStreamer
        .getPipeIot()
        .flatMap(Stream.fromIterable)
        .where(
          (final iotDevice) => iotDevice.typeDevice == TypeDevice.ups,
        )
        .where(
          (final iotDevice) => iotDevice.data != null,
        )
        .map((final iotDevice) => iotDevice.data as UpsData)
        .map((final iotDevice) => iotDevice.voltageDC)
        .bufferCount(10)
        .map(
          (final voltages) =>
              voltages.reduce((final value, final element) => value + element) /
              voltages.length,
        )
        .listen((final voltageAvg) {
      print('AVG voltage $voltageAvg');
      if (voltageAvg < _lowVoltage) {
        print('LOW voltage $voltageAvg');
        _subIot?.cancel().then((_) {
          print('UNSUB NasUpsShutDown');
          _runSshShutDown();
        });
      }
    });
  }
}
