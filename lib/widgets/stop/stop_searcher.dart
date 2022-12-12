import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/stop.dart';

import 'stop_search_field.dart';

class StopSearcher extends StatelessWidget {
  const StopSearcher({
    Key? key,
    required this.stops,
    required this.startStopOnPick,
    required this.targetStopOnPick,
  }) : super(key: key);

  final List<Stop> stops;
  final void Function(Stop) startStopOnPick;
  final void Function(Stop) targetStopOnPick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            StopSearchField(
                stops: stops,
                onSelect: startStopOnPick,
                hint: "Starting station")
          ],
        ),
        Row(
          children: [
            StopSearchField(
                stops: stops,
                onSelect: targetStopOnPick,
                hint: "Target station")
          ],
        ),
      ],
    );
  }
}