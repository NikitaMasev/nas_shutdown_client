import 'dart:async';

import 'package:nas_shutdown_client/adapters/iot_adapter.dart';
import 'package:nas_shutdown_client/models/client.dart';
import 'package:nas_shutdown_client/models/communicator_sign.dart';
import 'package:nas_shutdown_client/models/iot_devices_data_wrapper.dart';
import 'package:nas_shutdown_client/services/iot_communicator/iot_communicator_service.dart';
import 'package:nas_shutdown_client/services/iot_connector/iot_channel_provider.dart';

class IotCommunicatorServiceImpl implements IotCommunicatorService {
  IotCommunicatorServiceImpl({
    required final this.iotChannelProvider,
    required final this.iotAdapter,
  }) {
    _runSubscription();
  }

  final IotChannelProvider iotChannelProvider;
  final IotAdapter iotAdapter;

  final _controllerClient = StreamController<Client>.broadcast();
  final _controllerIotDevice =
      StreamController<IotDevicesDataWrapper>.broadcast();

  late final StreamSubscription _subChannel;

  void _runSubscription() {
    _subChannel = iotChannelProvider.watchRawChannel().listen(
      (final rawData) {
        final signModel = iotAdapter.partiallyDecodeSign(rawData);
        switch (signModel) {
          case Sign.client:
            final client = iotAdapter.decodeClient(rawData);
            _controllerClient.add(client);
            break;
          case Sign.iotDevices:
            final iotDevices = iotAdapter.decodeIotDevices(rawData);
            _controllerIotDevice.add(iotDevices);
            break;
          case Sign.unknown:
            break;
        }
      },
      onError: (final err) {
        if (_controllerClient.hasListener) {
          _controllerClient.addError(err as Object);
        }
        if (_controllerIotDevice.hasListener) {
          _controllerIotDevice.addError(err as Object);
        }
      },
    );
  }

  @override
  void sendClient(final Client client) {
    final encodedClient = iotAdapter.encodeClient(client);
    iotChannelProvider.sinkRawData(encodedClient);
  }

  @override
  Stream<Client> watchClientModel() => _controllerClient.stream;

  @override
  Stream<IotDevicesDataWrapper> watchIotDevicesModel() =>
      _controllerIotDevice.stream;
}
