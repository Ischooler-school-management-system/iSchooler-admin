import 'package:flutter/material.dart';

import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/features/responsive/responsive_drop_down.dart';
import '../../../../../common/features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/features/widgets/educonnect_drop_down_widget.dart';
import '../../../../../common/features/widgets/educonnect_screen.dart';
import '../../../../../common/features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/madpoly.dart';
import '../../data/models/student_model.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();

  // Use Studentmodel to store form data
  StudentModel studentData = StudentModel.empty();

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      enableflexibleScrolling: true,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ResponsiveDropDownRow(
              children: [
                EduconnectTextField(
                  // initialValue: 'test',
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
                  labelText: 'Email Address',

                  validator: EduconnectValidations.emailValidator,

                  onChanged: (value) {
                    setState(() {
                      studentData = studentData.copyWith(userName: value);
                    });
                  },
                ),
                EduconnectTextField(
                  // initialValue: 'test',
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
              ],
            ),

            ResponsiveDropDownRow(
              children: [
                EduconnectTextField(
                  // initialValue: '01111',
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
              ],
            ),
            ResponsiveDropDownRow(
              children: [
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
              ],
            ),

            EduconnectButton(
              button: EduconnectElevatedButton(
                width: 200,
                onPressed: onSubmitButtonPressed,
                text: 'Submit',
              ),
            ),
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
