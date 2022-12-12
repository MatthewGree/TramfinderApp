import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/connection.dart';

class ConnectionListTile extends StatelessWidget {
  final Connection connection;

  const ConnectionListTile({super.key, required this.connection});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _lineIdentifier(),
      _startToTarget(),
      _times()
    ]);
  }

  Column _lineIdentifier() {
    return Column(children: [Text(connection.line.lineId)]);
  }

  Column _startToTarget() {
    return Column(children: [
      Row(
        children: [Text(connection.from.name)],
      ),
      Row(
        children: [Text(connection.to.name)]
      )
    ]);
  }

  Column _times() {
      return Column(children: [
        Row(
          children: [Text(connection.startingTime.toString())],
        ),
        Row(
            children: [Text(connection.endingTime.toString())]
        )
      ]);
  }
}
