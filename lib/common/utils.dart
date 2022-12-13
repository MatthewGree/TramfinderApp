import 'dart:math';

import 'package:flutter/material.dart';

double responsiveFromHeight(BuildContext context, double multiplier, {double min = 2.0}) =>
    max(MediaQuery.of(context).size.height * multiplier, min);
double responsiveFromWidth(BuildContext context, double multiplier, {double min = 2.0}) =>
    max(MediaQuery.of(context).size.width * multiplier, min);