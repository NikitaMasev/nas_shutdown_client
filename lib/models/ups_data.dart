import 'package:json_annotation/json_annotation.dart';

part 'ups_data.g.dart';

@JsonSerializable()
class UpsData {
  UpsData({
    required this.tempUps,
    required this.tempAcc,
    required this.pwmCooler,
    required this.currentDC,
    required this.voltageDC,
  });

  factory UpsData.nonValid() => UpsData(
        tempUps: 0,
        tempAcc: 0,
        pwmCooler: -500,
        currentDC: 0,
        voltageDC: 0,
      );

  final double tempUps;
  final double tempAcc;
  final int pwmCooler;
  final int currentDC;
  final double voltageDC;

  bool get isValid => pwmCooler != -500;

  factory UpsData.fromJson(final Map<String, dynamic> json) =>
      _$UpsDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UpsDataToJson(this);

  @override
  String toString() =>
      '{tempUps: $tempUps, tempAcc: $tempAcc, pwmCooler: $pwmCooler,]'
      ' currentDC: $currentDC, voltageDC: $voltageDC}';
}
