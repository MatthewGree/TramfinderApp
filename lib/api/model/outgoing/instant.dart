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
