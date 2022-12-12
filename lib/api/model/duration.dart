import 'package:json_annotation/json_annotation.dart';
part 'duration.g.dart';
@JsonSerializable()
class Duration {
  final int hours;
  final int minutes;

  const Duration({required this.hours, required this.minutes});

  factory Duration.fromJson(Map<String, dynamic> json) => _$DurationFromJson(json);
  Map<String, dynamic> toJson() => _$DurationToJson(this);
}