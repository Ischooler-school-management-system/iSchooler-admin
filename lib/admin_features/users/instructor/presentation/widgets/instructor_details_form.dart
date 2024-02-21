import 'package:flutter/material.dart';

import '../../../../../common/common_features/widgets/educonnect_date_field.dart';
import '../../../../../common/common_features/widgets/educonnect_drop_down_widget.dart';
import '../../../../../common/common_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_assets.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_time_helper.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../user_model.dart';
import '../../data/models/instructor_model.dart';

class InstructorDetailsForm extends StatefulWidget {
  final InstructorModel? currentInstructorData;
  final Function(InstructorModel model) onSaved;

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
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(EduconnectAssets.blankProfileImage),
            ),
          ),

          /// name
          EduconnectTextField(
            initialValue: instructorData.name,
            labelText: 'Name',
            validator: EduconnectValidations.nameValidator,
            onSaved: (value) {
              instructorData = instructorData.copyWith(name: value);
              // setState(() {});
            },
          ),

          /// Email Address
          EduconnectTextField(
            // initialValue: 'test',
            initialValue: instructorData.email,

            labelText: 'Email Address',

            validator: EduconnectValidations.emailValidator,

            onSaved: (value) {
              instructorData = instructorData.copyWith(email: value);
              // setState(() {});
            },
          ),

          /// Date of Birth
          EduconnectDateField(
            initialValue:
                EduconnectDateTimeHelper.dateFormat(instructorData.dateOfBirth),
            labelText: 'Date of Birth',
            onTap: (date) {
              instructorData = instructorData.copyWith(dateOfBirth: date);
              setState(() {});
            },
          ),
          //  Todo: create a ui to select user gender
          /// Gender
          EduConnectDropdownWidget(
            labelText: 'Gender',
            // value: ,
            hint: instructorData.gender,
            onChanged: (value) {
              Madpoly.print(
                'gender after update = ',
                inspectObject: value,
                tag: 'user_details_form > ',
                developer: "Ziad",
              );
              instructorData = instructorData.copyWith(gender: value);
              setState(() {});
            },
            options: const ['Male', 'Female'],
          ),
/* 
          /// Role
          EduConnectDropdownWidget(
            labelText: 'Role',
            // value: ,
            hint: instructorData.role.name,
            onChanged: (value) {
              setState(() {
                instructorData = instructorData.copyWith(gender: value);
              });
            },
            options: const ['Admin', 'Instructor', 'Student'],
          ), */

          /// Phone Number
          EduconnectTextField(
            keyboardType: TextInputType.number,
            // initialValue: '01111',
            initialValue: instructorData.phoneNumber,

            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onSaved: (value) {
              instructorData = instructorData.copyWith(phoneNumber: value);
              // setState(() {});
            },
          ),

          /// Address
          EduconnectTextField(
            initialValue: instructorData.address,

            // initialValue: 'test',
            labelText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onSaved: (value) {
              instructorData = instructorData.copyWith(address: value);
              // setState(() {});
            },
          ),

          /// specialization
          EduconnectTextField(
            initialValue: instructorData.specialization,
            labelText: 'Specialization',
            validator: EduconnectValidations.nameValidator,
            onSaved: (value) {
              instructorData = instructorData.copyWith(specialization: value);
              // setState(() {});
            },
          ),

          /// hireDate
          EduconnectDateField(
            initialValue:
                EduconnectDateTimeHelper.dateFormat(instructorData.dateOfBirth),
            labelText: 'Hire Date',
            onTap: (date) {
              instructorData = instructorData.copyWith(hireDate: date);
              setState(() {});
            },
          ),
          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
        ],
      ),
    );
  }

  instructorDataSaved(UserModel user) {
    instructorData = instructorData.copyFromUser(user);
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSaved(instructorData);
    }
  }
}
