import 'package:json_annotation/json_annotation.dart';
import 'package:nas_shutdown_client/models/communicator_sign.dart';
import 'package:nas_shutdown_client/models/control_data.dart';

part 'client.g.dart';

@JsonSerializable()
class Client extends CommunicatorSign {
  Client({
    this.id,
    this.name,
    this.controlData,
  }) : super(sign: Sign.client);

  final int? id;
  final String? name;
  final ControlData? controlData;

  bool get nonValid => id == null && name == null && controlData == null;

  bool get unAuthorized => id == null;

  factory Client.unAuthorized() => Client();

  factory Client.fromJson(final Map<String, dynamic> json) =>
      _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
