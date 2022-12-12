import 'package:json_annotation/json_annotation.dart';
import 'package:tramfinder_app/api/model/stop.dart';
import 'package:tramfinder_app/api/model/time.dart';

part 'connection.g.dart';

@JsonSerializable()
class Connection {
  final Stop from;
  final Stop to;
  final Time startingTime;
  final Time endingTime;

  const Connection(
      {required this.from,
      required this.to,
      required this.startingTime,
      required this.endingTime});

  factory Connection.fromJson(Map<String, dynamic> json) => _$ConnectionFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionToJson(this);
}
