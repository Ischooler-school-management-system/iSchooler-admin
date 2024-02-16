// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../common/comon_features/widgets/educonnect_date_field.dart';
import '../../../../../common/comon_features/widgets/educonnect_drop_down_widget.dart';
import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_assets.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_time_helper.dart';
import '../../../../classes/data/models/class_model.dart';
import '../../../../classes/logic/cubit/classes_list_cubit.dart';
import '../../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../user_model.dart';
import '../../data/models/student_model.dart';
import '/common/madpoly.dart';

class StudentDetailsForm extends StatefulWidget {
  final StudentModel? currentStudentData;
  final Function(StudentModel model) onSaved;
  // final GlobalKey<FormState> formKey;
  const StudentDetailsForm({
    // required this.formKey,
    super.key,
    this.currentStudentData,
    required this.onSaved,
  });

  @override
  State<StudentDetailsForm> createState() => _StudentDetailsFormState();
}

class _StudentDetailsFormState extends State<StudentDetailsForm> {
  // Use Studentmodel to store form data
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // StudentModel studentData = StudentModel.empty();
  StudentModel studentData = StudentModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentStudentData != null;
    if (editingModel) {
      studentData = widget.currentStudentData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
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
            initialValue: studentData.name,
            labelText: 'Name',
            validator: EduconnectValidations.nameValidator,
            onSaved: (value) {
              studentData = studentData.copyWith(name: value);
              // setState(() {});
            },
          ),

          /// Email Address
          EduconnectTextField(
            // initialValue: 'test',
            initialValue: studentData.email,

            labelText: 'Email Address',

            validator: EduconnectValidations.emailValidator,

            onSaved: (value) {
              studentData = studentData.copyWith(email: value);
              // setState(() {});
            },
          ),

          /// Date of Birth
          EduconnectDateField(
            initialValue:
                EduconnectDateTimeHelper.format(studentData.dateOfBirth),
            labelText: 'Date of Birth',
            onTap: (date) {
              studentData = studentData.copyWith(dateOfBirth: date);
              setState(() {});
            },
          ),
          //  Todo: create a ui to select user gender
          /// Gender
          EduConnectDropdownWidget(
            labelText: 'Gender',
            // value: ,
            hint: studentData.gender,
            onChanged: (value) {
              Madpoly.print(
                'gender after update = ',
                inspectObject: value,
                tag: 'user_details_form > ',
                developer: "Ziad",
              );
              studentData = studentData.copyWith(gender: value);
              setState(() {});
            },
            options: const ['Male', 'Female'],
          ),

          /*   /// Role
          EduConnectDropdownWidget(
            labelText: 'Role',
            // value: ,
            hint: studentData.role.name,
            onChanged: (value) {
              setState(() {
                studentData = studentData.copyWith(gender: value);
              });
            },
            options: const ['Admin', 'Instructor', 'Student'],
          ),
 */
          /// Phone Number
          EduconnectTextField(
            // initialValue: '01111',
            initialValue: studentData.phoneNumber,

            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onSaved: (value) {
              studentData = studentData.copyWith(phoneNumber: value);
              // setState(() {});
            },
          ),

          /// Address
          EduconnectTextField(
            initialValue: studentData.address,

            // initialValue: 'test',
            labelText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onSaved: (value) {
              studentData = studentData.copyWith(address: value);
              // setState(() {});
            },
          ),

          /// class
          DashboardDropDownWidget<ClassesListCubit>(
              value: studentData.classModel.name,
              labelText: 'Class',
              onChanged: (EduconnectModel value) {
                Madpoly.print(
                  'class model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<ClassesListCubit>',
                  developer: "Ziad",
                );
                studentData =
                    studentData.copyWith(classModel: value as ClassModel);
                setState(() {});
              }),

          /// Payment Status
          //  Todo: create a ui to select student's payment status
          EduconnectTextField(
            initialValue: studentData.paymentStatus ? 'paid' : 'not paid',
            labelText: 'Specialization',
            validator: EduconnectValidations.nameValidator,
            /* onSaved: (value) {
              studentData = studentData.copyWith(paymentStatus: value);
              // setState(() {});
            }, */
          ),
          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
        ],
      ),
    );
  }

  onUserDataSaved(UserModel user) {
    studentData = studentData.copyFromUser(user);
  }

  onSubmitButtonPressed() {
    // if (_formKey.currentState!.validate() &&
    //     _userFormKey.currentState!.validate()) {
    _formKey.currentState!.save();

    widget.onSaved(studentData);
    // }
  }
}
