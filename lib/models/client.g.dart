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
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'controlData': instance.controlData,
    };
