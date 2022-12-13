import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:tramfinder_app/api/api_interface.dart';
import 'package:tramfinder_app/common/utils.dart';

import 'api/model/incoming/stop.dart';
import 'widgets/home_page.dart';

Future<ThemeData?> _getTheme(String path) async {
  final themeStr = await rootBundle.loadString(path);
  final themeJson = jsonDecode(themeStr);
  return ThemeDecoder.decodeThemeData(themeJson);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final lightTheme = await _getTheme("custom_theme.json");
  final darkTheme = await _getTheme("dark_theme.json");

  runApp(MyApp(
    lightTheme: lightTheme,
    darkTheme: darkTheme,
  ));
}

class _MyAppState extends State<MyApp> {
  late Future<List<Stop>> stops;
  ApiInterface api = ApiInterface();

  @override
  void initState() {
    super.initState();
    stops = api.fetchStops();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tramfinder',
        theme: widget.lightTheme ?? ThemeData.light(),
        darkTheme: widget.darkTheme ?? ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: FutureBuilder<List<Stop>>(
            future: stops,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomePage(
                    title: "Tramfinder", stops: snapshot.requireData);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: responsiveFromWidth(context, 0.125),
                      vertical: responsiveFromHeight(context, 0.125)),
                  child: const CircularProgressIndicator());
            })
        //home: const MyHomePage(title: 'Tramfinder'),
        );
  }
}

class MyApp extends StatefulWidget {
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;

  const MyApp({super.key, this.lightTheme, this.darkTheme});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}
