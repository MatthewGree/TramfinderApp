import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import 'model/incoming/route.dart';
import 'model/incoming/stop.dart';
import 'model/outgoing/instant.dart';

class ApiInterface {
  final client = http.Client();
  final String _rootUri = "83-229-84-64.cloud-xip.com:80";
  late Uri _nodesUri;

  ApiInterface._construct() {
    _nodesUri = Uri.https(_rootUri, "/stops");
  }

  static final ApiInterface instance = ApiInterface._construct();

  factory ApiInterface() {
    return instance;
  }

  Uri _routeUri(int fromId, int toId, Instant instant) {
    return Uri.https(_rootUri, "/route", {
      "start": fromId.toString(),
      "target": toId.toString(),
      "time": instant.toString()
    });
  }

  Future<List<Stop>> fetchStops() async {
    final response = await client.get(_nodesUri);
    List body = jsonDecode(utf8.decode(response.bodyBytes));
    return body.map((jsonStop) => Stop.fromJson(jsonStop)).toList();
  }

  Future<Either<String, ConnectionRoute>> fetchRoute(
      int fromId, int toId, Instant instant) async {

    final uri = _routeUri(fromId, toId, instant);
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      return Right(ConnectionRoute.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes))));
    } else if (response.statusCode == 404) {
      return Left(response.body);
    }
    return Left("Undefined error: ${response.toString()}");
  }
}
