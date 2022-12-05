// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iot_devices_data_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IotDevicesDataWrapper _$IotDevicesDataWrapperFromJson(
        Map<String, dynamic> json) =>
    IotDevicesDataWrapper(
      (json['devices'] as List<dynamic>)
          .map((e) => IotDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IotDevicesDataWrapperToJson(
        IotDevicesDataWrapper instance) =>
    <String, dynamic>{
      'devices': instance.devices,
    };
