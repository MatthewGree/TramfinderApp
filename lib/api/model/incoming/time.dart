import 'package:json_annotation/json_annotation.dart';
part 'time.g.dart';
@JsonSerializable()
class Time {
  final int hour;
  final int minutes;

  const Time({required this.hour, required this.minutes});

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
  Map<String, dynamic> toJson() => _$TimeToJson(this);
}
