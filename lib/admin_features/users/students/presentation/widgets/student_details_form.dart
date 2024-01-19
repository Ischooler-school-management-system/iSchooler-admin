// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../common/comon_features/responsive/responsive.dart';
import '../../../../../common/comon_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/comon_features/widgets/educonnect_drop_down_widget.dart';
import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_formatter.dart';
import '../../data/models/student_model.dart';

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

  StudentModel studentData = StudentModel.empty();
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
            initialValue: studentData.displayName,
            labelText: 'Username',
            validator: EduconnectValidations.nameValidator,
            onSaved: (value) {
              setState(() {
                studentData = studentData.copyWith(displayName: value);
              });
            },
          ),
          EduconnectTextField(
            // initialValue: 'test',
            initialValue: studentData.email,

            labelText: 'Email Address',

            validator: EduconnectValidations.emailValidator,

            onSaved: (value) {
              setState(() {
                studentData = studentData.copyWith(userName: value);
              });
            },
          ),
          EduconnectTextField(
            initialValue: educonnectDateFormatter(studentData.dateOfBirth),
            labelText: 'Date of Birth',
            validator: (value) {
              // Add validation logic for date of birth if needed
              return null;
            },
            onSaved: (value) {
              // Convert the value to DateTime and assign it to dateOfBirth
              // You may want to use a DatePicker for a better user experience
              setState(() {
                // studentData = studentData.copyWith(
                //     dateOfBirth: value != null ? DateTime.parse(value) : null);
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
            // initialValue: '01111',
            initialValue: studentData.phoneNumber,

            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onSaved: (value) {
              setState(() {
                studentData = studentData.copyWith(phoneNumber: value);
              });
            },
          ),
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
              setState(() {
                studentData = studentData.copyWith(address: value);
              });
            },
          ),
          EduConnectDropdownWidget(
            labelText: 'Class',
            // hint: 'Class',

            onChanged: (value) {
              setState(() {
                studentData = studentData.copyWith(classId: value);
              });
            },
            options: const ['claass 1', 'r 2', 'clasrs 2'],
          ),
          EduConnectDropdownWidget(
            labelText: 'Grade',
            onChanged: (value) {
              setState(() {
                studentData = studentData.copyWith(gradeId: value);
              });
            },
            options: const ['class 1', 'class 2', 'class 3'],
          ),
          EduConnectDropdownWidget(
            labelText: 'Gender',
            onChanged: (value) {
              setState(() {
                studentData = studentData.copyWith(gradeId: value);
              });
            },
            options: const ['Male', 'Female'],
          ),

          Row(
              children: Responsive.expandedChildren(
            padding: const EdgeInsets.all(8),
            children: [
              EduconnectButton(
                button: EduconnectElevatedButton(
                  // width: 200,
                  onPressed: () {
                    SmartDialog.dismiss();
                  },
                  text: 'cancel',
                ),
              ),
              EduconnectButton(
                button: EduconnectElevatedButton(
                  // width: 200,
                  onPressed: onSubmitButtonPressed,
                  text: 'Submit',
                ),
              ),
            ],
          )),
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
