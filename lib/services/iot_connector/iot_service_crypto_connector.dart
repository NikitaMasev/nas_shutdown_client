import 'package:nas_shutdown_client/services/crypto/crypto.dart';
import 'package:nas_shutdown_client/services/iot_connector/iot_channel_provider.dart';

class IotServiceCryptoConnector implements IotChannelProvider {
  IotServiceCryptoConnector({
    required final this.iotChannelProvider,
    required final this.crypto,
  });

  final IotChannelProvider iotChannelProvider;
  final Crypto crypto;

  @override
  void sinkRawData(final String data) {
    final encrypted = crypto.encrypt(data);
    iotChannelProvider.sinkRawData(encrypted);
  }

  @override
  Stream<String> watchRawChannel() => iotChannelProvider
      .watchRawChannel()
      .map(crypto.decrypt)
      .where((final data) => data.isNotEmpty);
}
