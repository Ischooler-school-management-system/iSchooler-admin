import 'package:flutter/material.dart';

import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/madpoly.dart';
import '../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../data/models/grade_model.dart';

class GradeDetailsForm extends StatefulWidget {
  final GradeModel? currentGradeData;
  final Function(EduconnectModel model) onSaved;

  const GradeDetailsForm(
      {super.key, this.currentGradeData, required this.onSaved});

  @override
  State<GradeDetailsForm> createState() => _GradeDetailsFormState();
}

class _GradeDetailsFormState extends State<GradeDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  // Use Grademodel to store form data
  GradeModel gradeData = GradeModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentGradeData != null;
    if (editingModel) {
      gradeData = widget.currentGradeData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'grade_details_form.dart > build',
      developer: "Ziad",
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EduconnectTextField(
            initialValue: gradeData.name,
            labelText: 'Grade Name',
            validator: EduconnectValidations.nameValidator,
            onChanged: (value) {
              setState(() {
                gradeData = gradeData.copyWith(name: value);
              });
            },
          ),
          /*
          EduconnectTextField(
            initialValue: gradeData.email,
            labelText: 'Email Address',
            validator: EduconnectValidations.emailValidator,
            onChanged: (value) {
              setState(() {
                gradeData = gradeData.copyWith(userName: value);
              });
            },
          ),
          EduconnectTextField(
            // initialValue: gradeData.dateOfBirth.toString(),
            initialValue: educonnectDateFormatter(gradeData.dateOfBirth),
            labelText: 'Date of Birth',
            validator: (value) {
              // Add validation logic for date of birth if needed
              return null;
            },
            onChanged: (value) {
              // Convert the value to DateTime and assign it to dateOfBirth
              // You may want to use a DatePicker for a better user experience
              setState(() {
                gradeData =
                    gradeData.copyWith(dateOfBirth: DateTime.parse(value));
              });
            },
          ),
          EduconnectTextField(
            initialValue: gradeData.phoneNumber,
            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onChanged: (value) {
              setState(() {
                gradeData = gradeData.copyWith(phoneNumber: value);
              });
            },
          ),
          EduconnectTextField(
            initialValue: gradeData.address,
            labelText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                gradeData = gradeData.copyWith(address: value);
              });
            },
          ), */
          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
        ],
      ),
    );
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSaved(gradeData);
    }
  }
}
