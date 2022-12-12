import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/api_interface.dart';
import 'package:tramfinder_app/widgets/search.dart';
import 'package:tramfinder_app/common/utils.dart';

import 'api/model/stop.dart';

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
                return MyHomePage(
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

// This widget is the root of your application.

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.stops});

  final String title;
  final List<Stop> stops;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stop? startingStop;
  Stop? targetStop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StopSearchField(
                  stops: widget.stops,
                  onSelect: (stop) => startingStop = stop,
                  hint: "Starting station")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StopSearchField(
                  stops: widget.stops,
                  onSelect: (stop) => targetStop = stop,
                  hint: "Target station")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(responsivePaddingH(context, 0.01)),
                child: ElevatedButton(
                    onPressed: () => {},
                    child: Padding(
                      padding:
                          EdgeInsets.all(responsivePaddingH(context, 0.03)),
                      child: const Text(
                        "Find route",
                        style: TextStyle(
                            fontSize: 23),
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
