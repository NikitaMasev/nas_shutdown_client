// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as int?,
      name: json['name'] as String?,
      controlData: json['controlData'] == null
          ? null
          : ControlData.fromJson(json['controlData'] as Map<String, dynamic>),
      sign: $enumDecodeNullable(_$SignEnumMap, json['sign']) ?? Sign.client,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'sign': _$SignEnumMap[instance.sign]!,
      'id': instance.id,
      'name': instance.name,
      'controlData': instance.controlData,
    };

const _$SignEnumMap = {
  Sign.client: 'client',
  Sign.iotDevices: 'iotDevices',
  Sign.unknown: 'unknown',
};
