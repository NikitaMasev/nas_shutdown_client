// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iot_devices_data_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IotDevicesDataWrapper _$IotDevicesDataWrapperFromJson(
        Map<String, dynamic> json) =>
    IotDevicesDataWrapper(
      devices: (json['devices'] as List<dynamic>)
          .map((e) => IotDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      sign: $enumDecodeNullable(_$SignEnumMap, json['sign']) ?? Sign.iotDevices,
    );

Map<String, dynamic> _$IotDevicesDataWrapperToJson(
        IotDevicesDataWrapper instance) =>
    <String, dynamic>{
      'sign': _$SignEnumMap[instance.sign]!,
      'devices': instance.devices,
    };

const _$SignEnumMap = {
  Sign.client: 'client',
  Sign.iotDevices: 'iotDevices',
  Sign.unknown: 'unknown',
};
