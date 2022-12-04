import 'package:nas_shutdown_client/internal/runnable.dart';
import 'package:nas_shutdown_client/models/iot_device.dart';
import 'package:nas_shutdown_client/services/iot_streamer.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class IotServiceConnector implements Runnable, IotStreamer {
  IotServiceConnector({
    required final this.ip,
    required final this.port,
  });

  final String ip;
  final String port;

  late final WebSocketChannel _channel;

  @override
  void run() {
    _channel = IOWebSocketChannel.connect(Uri.parse('ws://$ip:$port'));
  }

  @override
  Stream<List<IotDevice>> getPipeIot() {
    // TODO: implement getPipeIot
    throw UnimplementedError();
  }
}
