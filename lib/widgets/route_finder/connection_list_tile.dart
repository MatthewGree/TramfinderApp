import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/connection.dart';

class ConnectionListTile extends StatelessWidget {
  final Connection connection;

  const ConnectionListTile({super.key, required this.connection});

  Text _BigText(String string) =>
      Text(string, style: const TextStyle(fontSize: 20));

  Text _MediumText(String string) =>
      Text(string, style: const TextStyle(fontSize: 18));

  Widget expand(Widget widget) => Expanded(child: widget);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_lineIdentifier(), _startToTarget(), _times()]
            .map(expand)
            .toList());
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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(busOrTram),
        Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: _BigText(connection.line.lineId.padRight(3, "  ")))
      ],
    );
  }

  Column _startToTarget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _MediumText(connection.from.name),
          _MediumText(connection.to.name)
        ].map((w) => Center(child: w)).toList());
  }

  Column _times() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      _MediumText(connection.startingTime.toString()),
      _MediumText(connection.endingTime.toString())
    ]);
  }
}
