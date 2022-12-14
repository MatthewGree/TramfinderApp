import 'package:json_annotation/json_annotation.dart';
import 'connection.dart';
import 'duration.dart';
part 'connection_route.g.dart';
@JsonSerializable()
class ConnectionRoute {
  final List<Connection> connections;
  final Duration duration;

  const ConnectionRoute({required this.connections, required this.duration});

  factory ConnectionRoute.fromJson(Map<String, dynamic> json) => _$ConnectionRouteFromJson(json);
  Map<String, dynamic> toJson() => _$ConnectionRouteToJson(this);
}