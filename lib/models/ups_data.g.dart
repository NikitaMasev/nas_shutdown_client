// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ups_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpsData _$UpsDataFromJson(Map<String, dynamic> json) => UpsData(
      tempUps: (json['tempUps'] as num).toDouble(),
      tempAcc: (json['tempAcc'] as num).toDouble(),
      pwmCooler: json['pwmCooler'] as int,
      currentDC: json['currentDC'] as int,
      voltageDC: (json['voltageDC'] as num).toDouble(),
    );

Map<String, dynamic> _$UpsDataToJson(UpsData instance) => <String, dynamic>{
      'tempUps': instance.tempUps,
      'tempAcc': instance.tempAcc,
      'pwmCooler': instance.pwmCooler,
      'currentDC': instance.currentDC,
      'voltageDC': instance.voltageDC,
    };
