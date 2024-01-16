import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../common/comon_features/responsive/responsive.dart';
import '../../../../../common/comon_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../../../common/comon_features/widgets/educonnect_small_view.dart';
import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_formatter.dart';
import '../../../../../common/madpoly.dart';
import '../../data/models/admin_model.dart';

class AdminDetailsScreen extends StatefulWidget {
  final AdminModel currentAdminData;
  const AdminDetailsScreen({super.key, required this.currentAdminData});

  @override
  State<AdminDetailsScreen> createState() => _AdminDetailsScreenState();
}

class _AdminDetailsScreenState extends State<AdminDetailsScreen> {
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
    return EduconnectBoxConstrain(
      padding: const EdgeInsets.all(30.0),
      maxWidth: 500,
      child: EduconnectScreen(
        enableflexibleScrolling: true,
        padding: const EdgeInsets.all(8),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              EduconnectTextField(
                initialValue: widget.currentAdminData.userName,
                labelText: 'Username',
                validator: EduconnectValidations.nameValidator,
                onChanged: (value) {
                  setState(() {
                    adminData = adminData.copyWith(userName: value);
                  });
                },
              ),
              EduconnectTextField(
                initialValue: widget.currentAdminData.email,
                labelText: 'Email Address',
                validator: EduconnectValidations.emailValidator,
                onChanged: (value) {
                  setState(() {
                    adminData = adminData.copyWith(userName: value);
                  });
                },
              ),
              EduconnectTextField(
                // initialValue: widget.currentAdminData.dateOfBirth.toString(),
                initialValue: educonnectDateFormatter(
                    widget.currentAdminData.dateOfBirth),
                labelText: 'Date of Birth',
                validator: (value) {
                  // Add validation logic for date of birth if needed
                  return null;
                },
                onChanged: (value) {
                  // Convert the value to DateTime and assign it to dateOfBirth
                  // You may want to use a DatePicker for a better user experience
                  setState(() {
                    adminData =
                        adminData.copyWith(dateOfBirth: DateTime.parse(value));
                  });
                },
              ),
              EduconnectTextField(
                initialValue: widget.currentAdminData.phoneNumber,
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
                initialValue: widget.currentAdminData.address,
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
      Madpoly.print('User Data: $adminData');
    }
  }
}
