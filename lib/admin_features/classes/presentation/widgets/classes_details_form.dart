import 'package:flutter/material.dart';

import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/madpoly.dart';
import '../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../data/models/classes_model.dart';

class ClassDetailsForm extends StatefulWidget {
  final ClassModel? currentClassData;
  final Function(EduconnectModel model) onSaved;

  const ClassDetailsForm(
      {super.key, this.currentClassData, required this.onSaved});

  @override
  State<ClassDetailsForm> createState() => _ClassDetailsFormState();
}

class _ClassDetailsFormState extends State<ClassDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  // Use Classmodel to store form data
  ClassModel classData = ClassModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentClassData != null;
    if (editingModel) {
      classData = widget.currentClassData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'class_details_form.dart > build',
      developer: "Ziad",
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EduconnectTextField(
            initialValue: classData.name,
            labelText: 'Class Name',
            validator: EduconnectValidations.nameValidator,
            onChanged: (value) {
              setState(() {
                classData = classData.copyWith(name: value);
              });
            },
          ),
          /*
          EduconnectTextField(
            initialValue: classData.email,
            labelText: 'Email Address',
            validator: EduconnectValidations.emailValidator,
            onChanged: (value) {
              setState(() {
                classData = classData.copyWith(userName: value);
              });
            },
          ),
          EduconnectTextField(
            // initialValue: classData.dateOfBirth.toString(),
            initialValue: educonnectDateFormatter(classData.dateOfBirth),
            labelText: 'Date of Birth',
            validator: (value) {
              // Add validation logic for date of birth if needed
              return null;
            },
            onChanged: (value) {
              // Convert the value to DateTime and assign it to dateOfBirth
              // You may want to use a DatePicker for a better user experience
              setState(() {
                classData =
                    classData.copyWith(dateOfBirth: DateTime.parse(value));
              });
            },
          ),
          EduconnectTextField(
            initialValue: classData.phoneNumber,
            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onChanged: (value) {
              setState(() {
                classData = classData.copyWith(phoneNumber: value);
              });
            },
          ),
          EduconnectTextField(
            initialValue: classData.address,
            labelText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                classData = classData.copyWith(address: value);
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

      widget.onSaved(classData);
    }
  }
}
