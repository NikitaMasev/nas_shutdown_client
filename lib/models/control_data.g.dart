// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ControlData _$ControlDataFromJson(Map<String, dynamic> json) => ControlData(
      iotIdControl: json['iotIdControl'] as int,
      typeControl: $enumDecode(_$TypeControlEnumMap, json['typeControl']),
      configControl: json['configControl'] as String?,
    );

Map<String, dynamic> _$ControlDataToJson(ControlData instance) =>
    <String, dynamic>{
      'iotIdControl': instance.iotIdControl,
      'typeControl': _$TypeControlEnumMap[instance.typeControl]!,
      'configControl': instance.configControl,
    };

const _$TypeControlEnumMap = {
  TypeControl.powerOn: 'powerOn',
  TypeControl.powerOff: 'powerOff',
  TypeControl.rgba: 'rgba',
  TypeControl.rgbaEffects: 'rgbaEffects',
  TypeControl.changeName: 'changeName',
  TypeControl.register: 'register',
};
