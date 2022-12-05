// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iot_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IotDevice _$IotDeviceFromJson(Map<String, dynamic> json) => IotDevice(
      id: json['id'] as int,
      typeDevice: $enumDecode(_$TypeDeviceEnumMap, json['typeDevice']),
      name: json['name'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$IotDeviceToJson(IotDevice instance) => <String, dynamic>{
      'id': instance.id,
      'typeDevice': _$TypeDeviceEnumMap[instance.typeDevice]!,
      'name': instance.name,
      'data': instance.data,
    };

const _$TypeDeviceEnumMap = {
  TypeDevice.ups: 'ups',
  TypeDevice.lamp: 'lamp',
  TypeDevice.rgba: 'rgba',
  TypeDevice.rgbaAddress: 'rgbaAddress',
  TypeDevice.tempSensor: 'tempSensor',
  TypeDevice.unknown: 'unknown',
};
