import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tramfinder_app/api/model/incoming/time.dart';
import 'package:tramfinder_app/api/model/outgoing/instant.dart';
import 'package:tramfinder_app/common/utils.dart';

class InstantPicker extends StatefulWidget {
  final Instant startInstant;
  final void Function(Instant) onInstantPicked;

  const InstantPicker(
      {super.key, required this.startInstant, required this.onInstantPicked});

  @override
  State<InstantPicker> createState() => _InstantPickerState();
}

class _InstantPickerState extends State<InstantPicker> {
  late DateTime _date;
  late TimeOfDay _time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _pickerButton(
            text: DateFormat("yyyy-MM-dd").format(_date),
            onPressed: () => _showDatePicker(widget.startInstant.getDate())),
        const VerticalDivider(),
        _pickerButton(
            text: Time(hour: _time.hour, minutes: _time.minute).toString(),
            onPressed: () => _showTimePicker(widget.startInstant.getTime()))
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _date = widget.startInstant.getDate();
    _time = widget.startInstant.getTime();
  }

  void _pickInstant() =>
      widget.onInstantPicked(Instant.fromDateTime(_date, time: _time));

  void _showDatePicker(DateTime initialDate) => showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: initialDate.subtract(const Duration(days: 365)),
              lastDate: initialDate.add(const Duration(days: 365)))
          .then((value) {
        if (value != null) {
          setState(() {
            _date = value;
          });
          _pickInstant();
        }
      });

  void _showTimePicker(TimeOfDay initialTime) =>
      showTimePicker(context: context, initialTime: initialTime).then((value) {
        if (value != null) {
          setState(() {
            _time = value;
          });
          _pickInstant();
        }
      });

  Widget _pickerButton<T>(
          {required String text, required void Function()? onPressed}) =>
      ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: responsiveFromHeight(context, 0.02),
                horizontal: responsiveFromWidth(context, 0.02)),
            child: Row(
              children: [
                const Icon(Icons.edit),
                Text(
                  text,
                  style: const TextStyle(fontSize: 23),
                ),
              ],
            ),
          ));
}
