import 'dart:math' as math;

import 'package:flutter/material.dart';

double responsiveFromHeight(BuildContext context, double multiplier, {double min = 2.0, max = double.maxFinite}) =>
    math.min(math.max(MediaQuery.of(context).size.height * multiplier, min), max);
double responsiveFromWidth(BuildContext context, double multiplier, {double min = 2.0, max = double.maxFinite}) =>
    math.min(math.max(MediaQuery.of(context).size.width * multiplier, min), max);

Text bigText(String string, {TextAlign? textAlign}) =>
    Text(string, style: const TextStyle(fontSize: 20), textAlign: textAlign,);
Text mediumText(String string, {TextAlign? textAlign}) =>
    Text(string, style: const TextStyle(fontSize: 18), textAlign: textAlign,);