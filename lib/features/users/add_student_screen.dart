import 'package:flutter/material.dart';

import '../../common/features/widgets/educonnect_screen.dart';
import '../../common/features/widgets/fields/educonnect_text_field.dart';
import 'user/data/models/user_model.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();

  // Use UserModel to store form data
  UserModel userData = UserModel.empty();

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      enableScrolling: true,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EduconnectTextField(
              labelText: 'User ID',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter User ID';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  userData = userData.copyWith(id: value);
                });
              },
            ),
            const SizedBox(height: 10),
            EduconnectTextField(
              labelText: 'Username',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Username';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  userData = userData.copyWith(username: value);
                });
              },
            ),
            const SizedBox(height: 10),
            EduconnectTextField(
              labelText: 'Date of Birth',
              validator: (value) {
                // Add validation logic for date of birth if needed
                return null;
              },
              onChanged: (value) {
                // Convert the value to DateTime and assign it to dateOfBirth
                // You may want to use a DatePicker for a better user experience
                setState(() {
                  userData =
                      userData.copyWith(dateOfBirth: DateTime.parse(value));
                });
              },
            ),
            const SizedBox(height: 10),
            EduconnectTextField(
              labelText: 'Class ID',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Class ID';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  userData = userData.copyWith(classId: value);
                });
              },
            ),
            const SizedBox(height: 10),
            EduconnectTextField(
              labelText: 'Grade ID',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Grade ID';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  userData = userData.copyWith(gradeId: value);
                });
              },
            ),
            const SizedBox(height: 10),
            EduconnectTextField(
              labelText: 'Phone Number',
              validator: (value) {
                // Add phone number validation if needed
                return null;
              },
              onChanged: (value) {
                setState(() {
                  userData = userData.copyWith(phoneNumber: value);
                });
              },
            ),
            const SizedBox(height: 10),
            EduconnectTextField(
              labelText: 'Address',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Address';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  userData = userData.copyWith(address: value);
                });
              },
            ),
            const SizedBox(height: 10),
            EduconnectTextField(
              labelText: 'Gender',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Gender';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  userData = userData.copyWith(gender: value);
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Payment Status: '),
                Checkbox(
                  value: userData.paymentStatus,
                  onChanged: (value) {
                    setState(() {
                      userData =
                          userData.copyWith(paymentStatus: value ?? false);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, process the data
                  // You can add logic here to save the form data
                  // For example, send it to a database or an API
                  print('User Data: $userData');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
