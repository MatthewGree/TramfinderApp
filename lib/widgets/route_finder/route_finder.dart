import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/api_interface.dart';
import 'package:tramfinder_app/api/model/incoming/connection_route.dart';
import 'package:tramfinder_app/api/model/incoming/stop.dart';
import 'package:tramfinder_app/api/model/outgoing/instant.dart';
import 'package:tramfinder_app/common/utils.dart';
import 'package:tramfinder_app/widgets/route_finder/instant_picker.dart';

class _RouteFinderState extends State<RouteFinder> {
  Instant _instant = Instant.fromDateTime(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InstantPicker(
            startInstant: _instant,
            onInstantPicked: (instant) => setState(() {
                  _instant = instant;
                })),
        _findRouteButton(_getRoute)
      ],
    );
  }

  void _getRoute() {
    if (widget.targetStop != null && widget.startStop != null) {
      widget.onRouteFound(ApiInterface.instance
          .fetchRoute(widget.startStop!.id, widget.targetStop!.id, _instant));
    }
  }

  Widget _findRouteButton(void Function()? onPressed) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: _mainButton(text: "Find route", onPressed: onPressed));
  }

  Widget _mainButton<T>(
          {required String text, required void Function()? onPressed}) =>
      ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: responsiveFromHeight(context, 0.02),
                horizontal: responsiveFromWidth(context, 0.02)),
            child: Text(
              text,
              style: const TextStyle(fontSize: 23),
            ),
          ));
}

class RouteFinder extends StatefulWidget {
  final Stop? startStop;
  final Stop? targetStop;
  final void Function(Future<Either<String, ConnectionRoute>>) onRouteFound;

  const RouteFinder(
      {super.key,
      required this.startStop,
      required this.targetStop,
      required this.onRouteFound});

  @override
  State<StatefulWidget> createState() {
    return _RouteFinderState();
  }
}
