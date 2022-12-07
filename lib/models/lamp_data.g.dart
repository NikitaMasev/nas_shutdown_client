// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lamp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LampData _$LampDataFromJson(Map<String, dynamic> json) => LampData(
      controlPower: $enumDecode(_$TypeControlEnumMap, json['controlPower']),
    );

Map<String, dynamic> _$LampDataToJson(LampData instance) => <String, dynamic>{
      'controlPower': _$TypeControlEnumMap[instance.controlPower]!,
    };

const _$TypeControlEnumMap = {
  TypeControl.powerOn: 'powerOn',
  TypeControl.powerOff: 'powerOff',
  TypeControl.rgba: 'rgba',
  TypeControl.rgbaEffects: 'rgbaEffects',
  TypeControl.changeName: 'changeName',
  TypeControl.register: 'register',
};
