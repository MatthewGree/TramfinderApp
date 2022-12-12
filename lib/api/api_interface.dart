import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/stop.dart';

class ApiInterface {
  final String _rootUri = "https://83-229-84-64.cloud-xip.com:80";
  late Uri _nodesUri;
  final client = http.Client();

  ApiInterface() {
    _nodesUri = Uri.parse("$_rootUri/stops");
  }

  Future<List<Stop>> fetchStops() async {
    final response = await client.get(_nodesUri);
    List body = jsonDecode(utf8.decode(response.bodyBytes));
    return body.map((jsonStop) => Stop.fromJson(jsonStop)).toList();
  }
}
