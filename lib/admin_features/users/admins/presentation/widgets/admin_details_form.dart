import 'package:flutter/material.dart';

import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_formatter.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../data/models/admin_model.dart';

class AdminDetailsForm extends StatefulWidget {
  final AdminModel? currentAdminData;
  final Function(EduconnectModel model) onSaved;

  const AdminDetailsForm(
      {super.key, this.currentAdminData, required this.onSaved});

  @override
  State<AdminDetailsForm> createState() => _AdminDetailsFormState();
}

class _AdminDetailsFormState extends State<AdminDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  // Use Adminmodel to store form data
  AdminModel adminData = AdminModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EduconnectTextField(
            initialValue: adminData.name,
            labelText: 'name',
            validator: EduconnectValidations.nameValidator,
            onChanged: (value) {
              setState(() {
                adminData = adminData.copyWith(name: value);
              });
            },
          ),
          EduconnectTextField(
            initialValue: adminData.userModel.email,
            labelText: 'Email Address',
            validator: EduconnectValidations.emailValidator,
            onChanged: (value) {
              setState(() {
                adminData = adminData.copyWith(
                    userModel: adminData.userModel.copyWith(email: value));
              });
            },
          ),
          EduconnectTextField(
            initialValue:
                educonnectDateFormatter(adminData.userModel.dateOfBirth),
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
                    userModel: adminData.userModel
                        .copyWith(dateOfBirth: DateTime.parse(value)));
              });
            },
          ),
          EduconnectTextField(
            initialValue: adminData.userModel.phoneNumber,
            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onChanged: (value) {
              setState(() {
                adminData = adminData.copyWith(
                    userModel:
                        adminData.userModel.copyWith(phoneNumber: value));
              });
            },
          ),
          EduconnectTextField(
            initialValue: adminData.userModel.address,
            labelText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                adminData = adminData.copyWith(
                    userModel: adminData.userModel.copyWith(address: value));
              });
            },
          ),
          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
        ],
      ),
    );
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSaved(adminData);
    }
  }
}
