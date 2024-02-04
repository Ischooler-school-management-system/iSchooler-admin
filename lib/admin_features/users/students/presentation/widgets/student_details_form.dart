// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_formatter.dart';
import '../../../../classes/data/models/class_model.dart';
import '../../../../classes/logic/instructors_list_cubit/classes_list_cubit.dart';
import '../../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../data/models/student_model.dart';
import '/common/madpoly.dart';

class StudentDetailsForm extends StatefulWidget {
  final StudentModel? currentStudentData;
  final Function(EduconnectModel model) onSaved;
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
  final _formKey = GlobalKey<FormState>();

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
          EduconnectTextField(
            initialValue: studentData.name,
            labelText: 'Username',
            validator: EduconnectValidations.nameValidator,
            onSaved: (value) {
              studentData = studentData.copyWith(name: value);
              // setState(() {});
            },
          ),

          EduconnectTextField(
            initialValue: studentData.userModel.email,
            labelText: 'Email Address',
            validator: EduconnectValidations.emailValidator,
            onSaved: (value) {
              setState(() {
                studentData = studentData.copyWith(
                    userModel: studentData.userModel.copyWith(email: value));
              });
            },
          ),
          EduconnectTextField(
            initialValue:
                educonnectDateFormatter(studentData.userModel.dateOfBirth),
            labelText: 'Date of Birth',
            validator: (value) {
              // Add validation logic for date of birth if needed
              return null;
            },
            onSaved: (value) {
              setState(() {
                // studentData = studentData.copyWith(userModel: studentData.userModel.copyWith(dateOfBirth: DateTime.parse(value)));
              });
            },
          ),
          /*  EduConnectDropdownWidget(
                    labelText: 'Gender',
                    onSaved: (value) {
                      setState(() {
                        studentData = studentData.copyWith(gradeId: value);
                      });
                    },
                    options: const ['Male', 'Female'],
                  ), */

          EduconnectTextField(
            initialValue: studentData.userModel.phoneNumber,
            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onSaved: (value) {
              setState(() {
                studentData = studentData.copyWith(
                    userModel:
                        studentData.userModel.copyWith(phoneNumber: value));
              });
            },
          ),
          EduconnectTextField(
            initialValue: studentData.userModel.address,
            labelText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                studentData = studentData.copyWith(
                    userModel: studentData.userModel.copyWith(address: value));
              });
            },
          ),
          DashboardDropDownWidget<ClassesListCubit>(
              onChanged: (EduconnectModel value) {
            Madpoly.print(
              'class model = $value',
              tag:
                  'student_details_form > DashboardDropDownWidget<ClassesListCubit>',
              developer: "Ziad",
            );
            studentData = studentData.copyWith(classModel: value as ClassModel);
            setState(() {});
          }),

          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
          /*  Row(
      
      
          children: [
            const Text('Payment Status: '),
            Checkbox(
              value: studentData.paymentStatus,
              onSaved: (value) {
                setState(() {
                  studentData =
                      studentData.copyWith(paymentStatus: value ?? false);
                });
              },
            ),
          ],
        ), */
          // const SizedBox(height: 20),
        ],
      ),
    );
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSaved(studentData);
    }
  }
}
