import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/connection.dart';
import 'package:tramfinder_app/api/model/incoming/stop.dart';
import 'package:tramfinder_app/api/model/incoming/time.dart';
import 'package:tramfinder_app/common/utils.dart';

class ConnectionListTile extends StatelessWidget {
  final Connection connection;

  const ConnectionListTile({super.key, required this.connection});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: theme.toggleableActiveColor),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        _lineIdentifier(),
        _wideRow(connection.from, connection.startingTime),
        _wideRow(connection.to, connection.endingTime)
      ]),
    );
  }

  Row _wideRow(Stop stop, Time arriveTime) {
    return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Flexible(fit: FlexFit.tight, child: _createStopField(stop.name)), _createTimeField(arriveTime)]);
  }

  Widget _createTimeField(Time arriveTime) => Padding(padding: const EdgeInsets.only(right: 15), child: mediumText(arriveTime.toString()));

  Widget _lineIdentifier() {
    late IconData busOrTram = Icons.directions_bus_filled;
    try {
      int lineId = int.parse(connection.line.lineId);
      if (lineId < 100) {
        busOrTram = Icons.tram;
      }
    } catch (_) {}
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(busOrTram),
        Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: bigText(connection.line.lineId.padRight(3, "  ")))
      ],
    );
  }


  Widget _createStopField(String stopName) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: mediumText(stopName, textAlign: TextAlign.center),
    );

}
