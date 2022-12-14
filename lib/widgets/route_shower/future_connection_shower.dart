import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/connection_route.dart';
import 'package:tramfinder_app/widgets/route_shower/connection_route_shower.dart';

class FutureConnectionShower extends StatelessWidget {
  const FutureConnectionShower({
    Key? key,
    required this.foundRoute,
  }) : super(key: key);

  final Future<Either<String, ConnectionRoute>>? foundRoute;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<String, ConnectionRoute>>(
      future: foundRoute,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.requireData.isRight) {
            return ConnectionRouteShower(route: snapshot.requireData.right);
          } else {
            return alertDialog(context, snapshot.requireData.left);
          }
        } else if (snapshot.hasError) {
           return alertDialog(context, "${snapshot.error}");
        }
        return Visibility(
            visible: foundRoute != null,
            child: const Padding(padding: EdgeInsets.all(10.0), child: CircularProgressIndicator()));
      },
    );
  }

  AlertDialog alertDialog(BuildContext context, String message) => AlertDialog(
    title: Text(message),
    content: const Text("Error"),
  );
}