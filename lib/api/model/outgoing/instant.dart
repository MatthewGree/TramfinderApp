import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Instant {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;

  const Instant(
      {required this.year,
      required this.month,
      required this.day,
      required this.hour,
      required this.minute});

  factory Instant.fromDateTime(DateTime date, {TimeOfDay? time}) =>
      Instant(year: date.year, month: date.month, day: date.day, hour: time?.hour ?? date.hour, minute: time?.minute ?? date.minute);

  DateTime getDate() => DateTime(year, month, day, hour, minute);
  TimeOfDay getTime() => TimeOfDay(hour: hour, minute: minute);

  @override
  String toString() {
    final fourDigit = NumberFormat("0000");
    final twoDigit = NumberFormat("00");
    String year = fourDigit.format(this.year);
    String month = twoDigit.format(this.month);
    String day = twoDigit.format(this.day);
    String hour = twoDigit.format(this.hour);
    String minute = twoDigit.format(this.minute);
    return "$year-$month-${day}T$hour:$minute:00Z";
  }
}
