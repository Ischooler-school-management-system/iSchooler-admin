import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../../logic/all_admins_cubit/all_admins_cubit.dart';

class AdminDetailsScreen extends StatefulWidget {
  final AdminModel? currentAdminData;
  const AdminDetailsScreen({super.key, this.currentAdminData});

  @override
  State<AdminDetailsScreen> createState() => _AdminDetailsScreenState();
}

class _AdminDetailsScreenState extends State<AdminDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Use Adminmodel to store form data
  AdminModel adminData = AdminModel.empty();
  bool editingModel = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editingModel = widget.currentAdminData != null;
    if (editingModel) {
      adminData = widget.currentAdminData!.copyWith();
    }
  }

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
                initialValue: adminData.userName,
                labelText: 'Username',
                validator: EduconnectValidations.nameValidator,
                onChanged: (value) {
                  setState(() {
                    adminData = adminData.copyWith(userName: value);
                  });
                },
              ),
              EduconnectTextField(
                initialValue: adminData.email,
                labelText: 'Email Address',
                validator: EduconnectValidations.emailValidator,
                onChanged: (value) {
                  setState(() {
                    adminData = adminData.copyWith(userName: value);
                  });
                },
              ),
              EduconnectTextField(
                // initialValue: adminData.dateOfBirth.toString(),
                initialValue: educonnectDateFormatter(adminData.dateOfBirth),
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
                initialValue: adminData.phoneNumber,
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
                initialValue: adminData.address,
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
      if (editingModel) {
      } else {
        context.read<AllAdminsCubit>().add(
              educonnectModel: adminData,
            );
      }
    }
  }
}
