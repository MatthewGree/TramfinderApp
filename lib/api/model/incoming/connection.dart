import 'package:json_annotation/json_annotation.dart';
import 'package:tramfinder_app/api/model/incoming/line.dart';
import 'package:tramfinder_app/api/model/incoming/stop.dart';
import 'package:tramfinder_app/api/model/incoming/time.dart';

part 'connection.g.dart';

@JsonSerializable()
class Connection {
  final Stop from;
  final Stop to;
  final Time startingTime;
  final Time endingTime;
  final Line line;

  const Connection(
      {required this.from,
      required this.to,
      required this.startingTime,
      required this.endingTime,
      required this.line});

  factory Connection.fromJson(Map<String, dynamic> json) => _$ConnectionFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionToJson(this);
}
