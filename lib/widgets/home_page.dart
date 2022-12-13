import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/stop.dart';
import 'package:tramfinder_app/common/utils.dart';

import 'route_finder/route_finder.dart';
import 'stop/stop_searcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.stops});

  final String title;
  final List<Stop> stops;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stop? startStop;
  Stop? targetStop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: responsiveFromHeight(context, 0.01)),
                    child: StopSearcher(
                      stops: widget.stops,
                      startStopOnPick: (stop) => setState(() {
                        startStop = stop;
                      }),
                      targetStopOnPick: (stop) => setState(() {
                        targetStop = stop;
                      }),
                    ),
                  )
                ]),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      constraints: BoxConstraints(
                        maxWidth: responsiveFromWidth(context, 0.5,
                            min: 300, max: 600),
                      ),
                      child: RouteFinder(
                          startStop: startStop, targetStop: targetStop))
                ],
              ),
            )
          ]),
    );
  }
}
