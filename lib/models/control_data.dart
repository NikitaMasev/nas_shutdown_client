import 'package:json_annotation/json_annotation.dart';
import 'package:nas_shutdown_client/models/type_device.dart';

part 'control_data.g.dart';

@JsonSerializable()
class ControlData {
  ControlData({
    required final this.iotIdControl,
    required final this.typeControl,
    this.configControl,
  });

  final int iotIdControl;
  final TypeControl typeControl;
  final String? configControl;

  factory ControlData.fromJson(final Map<String, dynamic> json) =>
      _$ControlDataFromJson(json);

  Map<String, dynamic> toJson() => _$ControlDataToJson(this);
}
