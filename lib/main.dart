import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/api_interface.dart';

import 'api/model/incoming/stop.dart';
import 'widgets/home_page.dart';

void main() {
  runApp(const MyApp());
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
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
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
              return const CircularProgressIndicator();
            })
        //home: const MyHomePage(title: 'Tramfinder'),
        );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}
