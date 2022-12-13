import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/api_interface.dart';
import 'package:tramfinder_app/api/model/incoming/route.dart';
import 'package:tramfinder_app/api/model/incoming/stop.dart';
import 'package:tramfinder_app/common/utils.dart';
import 'package:tramfinder_app/widgets/route_finder/connection_list_tile.dart';

class _RouteFinderState extends State<RouteFinder> {
  Future<Either<String, ConnectionRoute>>? foundRoute;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_findRouteButton(getRoute)]),
        Expanded(
          child: Row(children: [
            FutureBuilder<Either<String, ConnectionRoute>>(
              future: foundRoute,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.requireData.isRight) {
                    return Expanded(
                        child: _connectionsList(
                            snapshot.requireData.right, theme));
                  } else {
                    return Text(snapshot.requireData.left);
                  }
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Visibility(
                    visible: foundRoute != null,
                    child: const CircularProgressIndicator());
              },
            )
          ]),
        )
      ],
    );
  }

  void getRoute() {
    if (widget.targetStop != null && widget.startStop != null) {
      setState(() {
        foundRoute = ApiInterface.instance.fetchRoute(
            widget.startStop!.id, widget.targetStop!.id, DateTime.now());
      });
    }
  }

  Widget _findRouteButton(void Function()? onPressed) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: responsiveFromHeight(context, 0.01)),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: responsiveFromHeight(context, 0.02),
                horizontal: responsiveFromWidth(context, 0.02)),
            child: const Text(
              "Find route",
              style: TextStyle(fontSize: 23),
            ),
          )),
    );
  }

  Widget _connectionsList(ConnectionRoute route, ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: theme.highlightColor,
          child: Text(
            "Duration of route: ${route.duration.hours}:${route.duration.minutes}, number of stops: ${route.connections.length}",
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Divider(),
        Expanded(
          child: ListView.separated(
            itemCount: route.connections.length,
            itemBuilder: (BuildContext context, int index) {
              return ConnectionListTile(connection: route.connections[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Icon(Icons.arrow_downward, size: 50.0);
            },
          ),
        )
      ],
    );
  }
}

class RouteFinder extends StatefulWidget {
  final Stop? startStop;
  final Stop? targetStop;

  const RouteFinder(
      {super.key, required this.startStop, required this.targetStop});

  @override
  State<StatefulWidget> createState() {
    return _RouteFinderState();
  }
}