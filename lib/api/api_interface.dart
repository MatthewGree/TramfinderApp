import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tramfinder_app/api/model/outgoing/route_request.dart';

import 'model/incoming/route.dart';
import 'model/incoming/stop.dart';
import 'model/outgoing/instant.dart';

class ApiInterface {
  final String _rootUri = "https://83-229-84-64.cloud-xip.com:80";
  late Uri _nodesUri;
  late Uri _routeUri;
  final client = http.Client();

  ApiInterface() {
    _nodesUri = Uri.parse("$_rootUri/stops");
    _routeUri = Uri.parse("$_rootUri/route");
  }

  Future<List<Stop>> fetchStops() async {
    final response = await client.get(_nodesUri);
    List body = jsonDecode(utf8.decode(response.bodyBytes));
    return body.map((jsonStop) => Stop.fromJson(jsonStop)).toList();
  }

  Future<Route> fetchRoute(int fromId, int toId, DateTime dateTime) async {
    final requestBody = RouteRequest.fromInstant(
        Instant(
            year: dateTime.year,
            month: dateTime.month,
            day: dateTime.day,
            hour: dateTime.hour,
            minute: dateTime.minute),
        from: fromId,
        to: toId);

    final request = http.Request("GET", _routeUri);
    request.body = jsonEncode(requestBody);

    final responseStream = await client.send(request);
    final response = await http.Response.fromStream(responseStream);
    return Route.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
