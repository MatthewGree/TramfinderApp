import 'package:json_annotation/json_annotation.dart';
part 'line.g.dart';
@JsonSerializable()
class Line {
  final String lineId;
  final int varianceId;

  const Line({required this.lineId, required this.varianceId});

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);
  Map<String, dynamic> toJson() => _$LineToJson(this);
}