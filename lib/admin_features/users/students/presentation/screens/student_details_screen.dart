import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../common/comon_features/responsive/responsive.dart';
import '../../../../../common/comon_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/comon_features/widgets/educonnect_drop_down_widget.dart';
import '../../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../../../common/comon_features/widgets/educonnect_small_view.dart';
import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_formatter.dart';
import '../../../../../common/madpoly.dart';
import '../../data/models/student_model.dart';

class StudentDetailsScreen extends StatefulWidget {
  final StudentModel currentStudentData;
  const StudentDetailsScreen({super.key, required this.currentStudentData});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Use Studentmodel to store form data
  StudentModel studentData = StudentModel.empty();

  @override
  Widget build(BuildContext context) {
    return EduconnectBoxConstrain(
      padding: const EdgeInsets.all(30.0),
      maxWidth: 500,
      child: EduconnectScreen(
        enableflexibleScrolling: true,
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              EduconnectTextField(
                initialValue: widget.currentStudentData.userName,
                labelText: 'Username',
                validator: EduconnectValidations.nameValidator,
                onChanged: (value) {
                  setState(() {
                    studentData = studentData.copyWith(userName: value);
                  });
                },
              ),
              EduconnectTextField(
                // initialValue: 'test',
                initialValue: widget.currentStudentData.email,

                labelText: 'Email Address',

                validator: EduconnectValidations.emailValidator,

                onChanged: (value) {
                  setState(() {
                    studentData = studentData.copyWith(userName: value);
                  });
                },
              ),
              EduconnectTextField(
                initialValue: educonnectDateFormatter(
                    widget.currentStudentData.dateOfBirth),
                labelText: 'Date of Birth',
                validator: (value) {
                  // Add validation logic for date of birth if needed
                  return null;
                },
                onChanged: (value) {
                  // Convert the value to DateTime and assign it to dateOfBirth
                  // You may want to use a DatePicker for a better user experience
                  setState(() {
                    studentData = studentData.copyWith(
                        dateOfBirth: DateTime.parse(value));
                  });
                },
              ),
              /*  EduConnectDropdownWidget(
                    labelText: 'Gender',
                    onChanged: (value) {
                      setState(() {
                        studentData = studentData.copyWith(gradeId: value);
                      });
                    },
                    options: const ['Male', 'Female'],
                  ), */

              EduconnectTextField(
                // initialValue: '01111',
                initialValue: widget.currentStudentData.phoneNumber,

                labelText: 'Phone Number',
                validator: (value) {
                  // Add phone number validation if needed
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    studentData = studentData.copyWith(phoneNumber: value);
                  });
                },
              ),
              EduconnectTextField(
                initialValue: widget.currentStudentData.address,

                // initialValue: 'test',
                labelText: 'Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Address';
                  }
                  return null;
                },
                onChanged: (value) {
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
              onChanged: (value) {
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
        ),
      ),
    );
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, process the data
      // You can add logic here to save the form data
      // For example, send it to a database or an API
      Madpoly.print('User Data: $studentData');
    }
  }
}
