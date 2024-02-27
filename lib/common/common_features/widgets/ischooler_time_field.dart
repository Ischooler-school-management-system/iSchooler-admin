import 'package:flutter/material.dart';

import '../../functions/ischooler_date_time_helper.dart';
import 'fields/ischooler_text_field.dart';

class IschoolerTimeField extends StatefulWidget {
  final TimeOfDay? initialValue;
  final Function(DateTime time) onTap;
  final String? labelText;

  const IschoolerTimeField({
    super.key,
    this.initialValue,
    required this.onTap,
    this.labelText,
  });

  @override
  State<IschoolerTimeField> createState() => _IschoolerTimeFieldState();
}

class _IschoolerTimeFieldState extends State<IschoolerTimeField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialValue != null
          ? _formatTime(widget.initialValue!)
          : null,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IschoolerTextField(
      controller: _controller,
      labelText: widget.labelText,
      validator: (value) {
        // Add validation logic for time if needed
        return value == null ? 'Please select a time' : null;
      },
      onTap: () async {
        TimeOfDay? time = TimeOfDay.now();
        FocusScope.of(context).requestFocus(FocusNode());
        time = await showTimePicker(
          context: context,
          initialTime: widget.initialValue ?? TimeOfDay.now(),
        );
        if (time != null) {
          widget.onTap(_convertToDateTime(time));
          _controller.text = _formatTime(time);
        }
      },
    );
  }

  DateTime _convertToDateTime(TimeOfDay timeOfDay) {
    final TimeOfDay formattedTime =
        TimeOfDay(hour: timeOfDay.hour, minute: timeOfDay.minute);
    var dateTime =
        DateTime(500, 1, 1, formattedTime.hour, formattedTime.minute);
    return dateTime;
  }

  String _formatTime(TimeOfDay timeOfDay) {
    DateTime convertToDateTime = _convertToDateTime(timeOfDay);
    final String? formattedString =
        IschoolerDateTimeHelper.timeFormat(convertToDateTime);
    return formattedString ?? '';
  }
}
