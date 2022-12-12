import 'package:json_annotation/json_annotation.dart';
import 'connection.dart';
import 'duration.dart';
part 'route.g.dart';
@JsonSerializable()
class Route {
  final List<Connection> connections;
  final Duration duration;

  const Route({required this.connections, required this.duration});

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
  Map<String, dynamic> toJson() => _$RouteToJson(this);
}