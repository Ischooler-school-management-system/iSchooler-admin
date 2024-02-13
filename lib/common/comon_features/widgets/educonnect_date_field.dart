// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:school_admin/common/comon_features/widgets/fields/educonnect_text_field.dart';

class EduconnectDateField extends StatelessWidget {
  final String? initialValue;
  final Function(DateTime date) onTap;
  final String? labelText;

  const EduconnectDateField({
    super.key,
    this.initialValue,
    required this.onTap,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return EduconnectTextField(
      initialValue: initialValue,
      labelText: labelText,
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
        onTap(date);
      },
    );
  }
}
