import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/stop.dart';
import 'package:tramfinder_app/common/utils.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              StopSearcher(
                stops: widget.stops,
                startStopOnPick: (stop) => setState(() {
                  startStop = stop;
                }),
                targetStopOnPick: (stop) => setState(() {
                  targetStop = stop;
                }),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: responsivePaddingH(context, 0.01)),
                  child: ElevatedButton(
                      onPressed: () => {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: responsivePaddingH(context, 0.02),
                            horizontal: responsivePaddingW(context, 0.02)),
                        child: const Text(
                          "Find route",
                          style: TextStyle(fontSize: 23),
                        ),
                      )),
                )
              ],
            )
          ]),
    );
  }
}
