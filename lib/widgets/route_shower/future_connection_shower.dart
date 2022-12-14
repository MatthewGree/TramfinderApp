import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:tramfinder_app/api/model/incoming/route.dart';
import 'package:tramfinder_app/widgets/route_shower/connection_shower.dart';

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
            return ConnectionShow(route: snapshot.requireData.right);
          } else {
            _showAlertDialog(context, snapshot.requireData.left);
          }
        } else if (snapshot.hasError) {
           _showAlertDialog(context, "${snapshot.error}");
        }
        return Visibility(
            visible: foundRoute != null,
            child: const Padding(padding: EdgeInsets.all(10.0), child: CircularProgressIndicator()));
      },
    );
  }

  void _showAlertDialog(BuildContext context, String message) => showDialog(context: context, builder: (BuildContext context) => AlertDialog(
    title: Text(message),
    content: const Text("Error"),
    actions: [TextButton(onPressed: () {}, child: const Text("OK"))],
  ));
}