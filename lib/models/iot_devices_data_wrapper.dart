import 'package:json_annotation/json_annotation.dart';
import 'package:nas_shutdown_client/models/communicator_sign.dart';
import 'package:nas_shutdown_client/models/iot_device.dart';

part 'iot_devices_data_wrapper.g.dart';

@JsonSerializable()
class IotDevicesDataWrapper extends CommunicatorSign {
  IotDevicesDataWrapper(this.devices) : super(sign: Sign.iotDevices);

  final List<IotDevice> devices;

  @override
  Map<String, dynamic> toJson() => _$IotDevicesDataWrapperToJson(this);

  factory IotDevicesDataWrapper.fromJson(final Map<String, dynamic> json) =>
      _$IotDevicesDataWrapperFromJson(json);
}
