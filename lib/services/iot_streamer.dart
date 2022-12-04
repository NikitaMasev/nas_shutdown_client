import 'package:nas_shutdown_client/models/iot_device.dart';

abstract class IotStreamer {
  Stream<List<IotDevice>> getPipeIot();
}
