import 'package:flutter/material.dart';

import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_formatter.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../data/models/instructor_model.dart';

class InstructorDetailsForm extends StatefulWidget {
  final InstructorModel? currentInstructorData;
  final Function(EduconnectModel model) onSaved;

  const InstructorDetailsForm(
      {super.key, this.currentInstructorData, required this.onSaved});

  @override
  State<InstructorDetailsForm> createState() => _InstructorDetailsFormState();
}

class _InstructorDetailsFormState extends State<InstructorDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  // Use Instructormodel to store form data
  InstructorModel instructorData = InstructorModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentInstructorData != null;
    if (editingModel) {
      instructorData = widget.currentInstructorData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'instructor_details_form.dart > build',
      developer: "Ziad",
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EduconnectTextField(
            initialValue: instructorData.displayName,
            labelText: 'Display Name',
            validator: EduconnectValidations.nameValidator,
            onChanged: (value) {
              setState(() {
                instructorData = instructorData.copyWith(displayName: value);
              });
            },
          ),
          EduconnectTextField(
            initialValue: instructorData.email,
            labelText: 'Email Address',
            validator: EduconnectValidations.emailValidator,
            onChanged: (value) {
              setState(() {
                instructorData = instructorData.copyWith(userName: value);
              });
            },
          ),
          EduconnectTextField(
            // initialValue: instructorData.dateOfBirth.toString(),
            initialValue: educonnectDateFormatter(instructorData.dateOfBirth),
            labelText: 'Date of Birth',
            validator: (value) {
              // Add validation logic for date of birth if needed
              return null;
            },
            onChanged: (value) {
              // Convert the value to DateTime and assign it to dateOfBirth
              // You may want to use a DatePicker for a better user experience
              setState(() {
                instructorData =
                    instructorData.copyWith(dateOfBirth: DateTime.parse(value));
              });
            },
          ),
          EduconnectTextField(
            initialValue: instructorData.phoneNumber,
            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onChanged: (value) {
              setState(() {
                instructorData = instructorData.copyWith(phoneNumber: value);
              });
            },
          ),
          EduconnectTextField(
            initialValue: instructorData.address,
            labelText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                instructorData = instructorData.copyWith(address: value);
              });
            },
          ),
          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
        ],
      ),
    );
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSaved(instructorData);
    }
  }
}
