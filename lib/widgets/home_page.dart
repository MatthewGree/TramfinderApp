import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/connection_route.dart';
import 'package:tramfinder_app/api/model/incoming/stop.dart';
import 'package:tramfinder_app/common/utils.dart';
import 'package:tramfinder_app/widgets/route_shower/future_connection_shower.dart';

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
  Stop? _startStop;
  Stop? _targetStop;
  Future<Either<String, ConnectionRoute>>? _foundRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_buildStopSearcher(context), _buildRouteFinder(), _buildFutureConnectionShower()]),
      ),
    );
  }

  Widget _buildFutureConnectionShower() {
    return FutureConnectionShower(foundRoute: _foundRoute);
  }

  Widget _buildRouteFinder() {
    return RouteFinder(
      startStop: _startStop,
      targetStop: _targetStop,
      onRouteFound: (route) => setState(() {
        _foundRoute = route;
      }),
    );
  }

  Row _buildStopSearcher(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(bottom: responsiveFromHeight(context, 0.01)),
            child: StopSearcher(
              stops: widget.stops,
              startStopOnPick: (stop) => setState(() {
                _startStop = stop;
              }),
              targetStopOnPick: (stop) => setState(() {
                _targetStop = stop;
              }),
            ),
          )
        ]);
  }
}
