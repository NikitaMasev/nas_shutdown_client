import 'package:nas_shutdown_client/internal/runnable.dart';
import 'package:nas_shutdown_client/services/iot_connector/iot_channel_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class IotServiceConnector implements Runnable, IotChannelProvider {
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
  void sinkRawData(final String data) => _channel.sink.add(data);

  @override
  Stream<String> watchRawChannel() => _channel.stream.whereType<String>();
}
