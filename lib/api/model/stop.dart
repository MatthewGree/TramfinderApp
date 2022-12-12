import 'package:json_annotation/json_annotation.dart';
part 'stop.g.dart';
@JsonSerializable()
class Stop {
  final int id;
  final String name;

  const Stop({
    required this.id,
    required this.name
  });

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);
  Map<String, dynamic> toJson() => _$StopToJson(this);
}