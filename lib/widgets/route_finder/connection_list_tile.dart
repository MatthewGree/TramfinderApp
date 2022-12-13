import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/connection.dart';
import 'package:tramfinder_app/common/utils.dart';

class ConnectionListTile extends StatelessWidget {
  final Connection connection;

  const ConnectionListTile({super.key, required this.connection});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 3.0, color: theme.toggleableActiveColor),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          _lineIdentifier(),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [_startToTarget(), _times()]),
        ]),
      ),
    );
  }

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

  Widget _startToTarget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [connection.from.name, connection.to.name]
            .map((text) => mediumText(text, textAlign: TextAlign.center))
            .map((text) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15), child: text))
            .toList());
  }

  Column _times() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      mediumText(connection.startingTime.toString()),
      mediumText(connection.endingTime.toString())
    ]);
  }
}
