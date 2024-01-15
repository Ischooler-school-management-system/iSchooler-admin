import 'package:flutter/material.dart';

import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/comon_features/responsive/responsive_drop_down.dart';
import '../../../../../common/comon_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/madpoly.dart';
import '../../data/models/admin_model.dart';

class AddAdminScreen extends StatefulWidget {
  const AddAdminScreen({super.key});

  @override
  State<AddAdminScreen> createState() => _AddAdminScreenState();
}

class _AddAdminScreenState extends State<AddAdminScreen> {
  final _formKey = GlobalKey<FormState>();

  // Use Adminmodel to store form data
  AdminModel adminData = AdminModel.empty();

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'add_addmin_screen > build',
      developer: "Ziad",
    );
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
                      adminData = adminData.copyWith(userName: value);
                    });
                  },
                ),
                EduconnectTextField(
                  // initialValue: 'test',
                  labelText: 'Email Address',

                  validator: EduconnectValidations.emailValidator,

                  onChanged: (value) {
                    setState(() {
                      adminData = adminData.copyWith(userName: value);
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
                      adminData = adminData.copyWith(
                          dateOfBirth: DateTime.parse(value));
                    });
                  },
                ),
                /*  EduConnectDropdownWidget(
                  labelText: 'Gender',
                  onChanged: (value) {
                    setState(() {
                      adminData = adminData.copyWith(gradeId: value);
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
                      adminData = adminData.copyWith(phoneNumber: value);
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
                      adminData = adminData.copyWith(address: value);
                    });
                  },
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
            value: adminData.paymentStatus,
            onChanged: (value) {
              setState(() {
                adminData =
                    adminData.copyWith(paymentStatus: value ?? false);
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
      Madpoly.print('User Data: $adminData');
    }
  }
}
