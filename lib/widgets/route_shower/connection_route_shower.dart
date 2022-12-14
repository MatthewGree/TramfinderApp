import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/connection_route.dart';
import 'package:tramfinder_app/common/utils.dart';

import 'connection_list_tile.dart';

class ConnectionRouteShower extends StatelessWidget {
  const ConnectionRouteShower({
    Key? key,
    required this.route,
  }) : super(key: key);

  final ConnectionRoute route;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            [bigText("DURATION"), bigText(route.duration.toString())],
            [bigText("STOPS"), bigText(route.connections.length.toString())]
          ]
              .map((kids) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: kids,
          ))
              .map((w) => Card(
              elevation: 0,
              shape: Border.fromBorderSide(
                  BorderSide(color: theme.toggleableActiveColor)
              ),
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  minWidth: 120,
                ),
                child: w,
              )))
              .toList(),
        ),
        const Divider(),
        Container(
          constraints: BoxConstraints(maxWidth: responsiveFromWidth(context, 0.5)),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: route.connections.length,
            itemBuilder: (BuildContext context, int index) {
              return ConnectionListTile(connection: route.connections[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const RotatedBox(quarterTurns: 2,child: Icon(Icons.change_history, size: 25.0));
            },
          ),
        )
      ],
    );
  }
}