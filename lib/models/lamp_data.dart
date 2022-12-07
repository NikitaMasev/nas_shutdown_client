import 'package:json_annotation/json_annotation.dart';
import 'package:nas_shutdown_client/models/type_device.dart';

part 'lamp_data.g.dart';

@JsonSerializable()
class LampData {
  LampData({
    required this.controlPower,
  });

  final TypeControl controlPower;

  factory LampData.fromJson(final Map<String, dynamic> json) =>
      _$LampDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LampDataToJson(this);
}
