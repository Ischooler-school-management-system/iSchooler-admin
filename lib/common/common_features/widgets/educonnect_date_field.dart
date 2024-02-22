// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import '../../../common/common_features/widgets/fields/educonnect_text_field.dart';
import '../../functions/educonnect_date_time_helper.dart';

class IschoolerDateField extends StatefulWidget {
  final String? initialValue;
  final Function(DateTime date) onTap;
  final String? labelText;

  const IschoolerDateField({
    super.key,
    this.initialValue,
    required this.onTap,
    this.labelText,
  });

  @override
  State<IschoolerDateField> createState() => _IschoolerDateFieldState();
}

class _IschoolerDateFieldState extends State<IschoolerDateField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IschoolerTextField(
      controller: _controller,
      // initialValue: widget.initialValue,
      labelText: widget.labelText,
      validator: (value) {
        // Add validation logic for date of birth if needed
        return value == null ? 'Please select a date' : null;
      },
      onTap: () async {
        DateTime date = DateTime(1900);
        FocusScope.of(context).requestFocus(FocusNode());
        date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100)) ??
            DateTime(1900);
        widget.onTap(date);
        _controller.text = IschoolerDateTimeHelper.dateFormat(date) ?? '';
      },
    );
  }
}
