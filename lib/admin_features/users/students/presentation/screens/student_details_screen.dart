import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../../logic/all_students_cubit/all_students_cubit.dart';

import '../../../../../common/comon_features/responsive/responsive.dart';
import '../../../../../common/comon_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/comon_features/widgets/educonnect_drop_down_widget.dart';
import '../../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../../../common/comon_features/widgets/educonnect_small_view.dart';
import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_formatter.dart';
import '../../../../../common/madpoly.dart';
import '../../../admins/logic/all_admins_cubit/all_admins_cubit.dart';
import '../../data/models/student_model.dart';

class StudentDetailsScreen extends StatefulWidget {
  final StudentModel? currentStudentData;
  const StudentDetailsScreen({super.key, this.currentStudentData});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Use Studentmodel to store form data
  StudentModel studentData = StudentModel.empty();
  bool editingModel = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editingModel = widget.currentStudentData != null;
    if (editingModel) {
      studentData = widget.currentStudentData!.copyWith();
    }
  }

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
                initialValue: studentData.userName,
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
                initialValue: studentData.email,

                labelText: 'Email Address',

                validator: EduconnectValidations.emailValidator,

                onChanged: (value) {
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
                initialValue: studentData.phoneNumber,

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
                initialValue: studentData.address,

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
      if (editingModel) {
      } else {
        context.read<AllStudentsCubit>().addStudent(
              student: studentData,
            );
      }
    }
  }
}
