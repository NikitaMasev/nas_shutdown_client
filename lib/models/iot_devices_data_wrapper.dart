import 'package:json_annotation/json_annotation.dart';
import 'package:nas_shutdown_client/models/iot_device.dart';

part 'iot_devices_data_wrapper.g.dart';

@JsonSerializable(createFactory: false)
class IotDevicesDataWrapper {
  IotDevicesDataWrapper(this.devices);

  final List<IotDevice> devices;

  @override
  Map<String, dynamic> toJson() => _$IotDevicesDataWrapperToJson(this);
}
