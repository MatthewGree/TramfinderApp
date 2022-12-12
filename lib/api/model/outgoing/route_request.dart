import 'package:json_annotation/json_annotation.dart';
import 'package:tramfinder_app/api/model/outgoing/instant.dart';
part 'route_request.g.dart';
@JsonSerializable()
class RouteRequest {
  final int from;
  final int to;
  late String time;

  RouteRequest.fromInstant(Instant time, {required this.from, required this.to}) {
    this.time = time.toString();
  }

  RouteRequest({required this.from, required this.to, required this.time});

  factory RouteRequest.fromJson(Map<String, dynamic> json) => _$RouteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RouteRequestToJson(this);
}