import 'package:flutter/material.dart';

import '../../../../../common/common_features/widgets/fields/ischooler_text_field.dart';
import '../../../../../common/ischooler_validation.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../data/models/admin_role_model.dart';

class AdminRoleDetailsForm extends StatefulWidget {
  final AdminRoleModel? currentAdminRoleData;
  final Function(AdminRoleModel model) onSaved;

  const AdminRoleDetailsForm(
      {super.key, this.currentAdminRoleData, required this.onSaved});

  @override
  State<AdminRoleDetailsForm> createState() => _AdminRoleDetailsFormState();
}

class _AdminRoleDetailsFormState extends State<AdminRoleDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  // Use AdminRolemodel to store form data
  AdminRoleModel adminroleData = AdminRoleModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentAdminRoleData != null;
    if (editingModel) {
      adminroleData = widget.currentAdminRoleData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'adminrole_details_form.dart > build',
      developer: "Ziad",
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          IschoolerTextField(
            initialValue: adminroleData.name,
            labelText: 'AdminRole Name',
            validator: IschoolerValidations.nameValidator,
            onChanged: (value) {
              setState(() {
                adminroleData = adminroleData.copyWith(name: value);
              });
            },
          ),
          /*
          IschoolerTextField(
            initialValue: adminroleData.email,
            labelText: 'Email Address',
            validator: IschoolerValidations.emailValidator,
            onChanged: (value) {
              setState(() {
                adminroleData = adminroleData.copyWith(userName: value);
              });
            },
          ),
          IschoolerTextField(
            // initialValue: adminroleData.dateOfBirth.toString(),
            initialValue: educonnectDateFormatter(adminroleData.dateOfBirth),
            labelText: 'Date of Birth',
            validator: (value) {
              // Add validation logic for date of birth if needed
              return null;
            },
            onChanged: (value) {
              // Convert the value to DateTime and assign it to dateOfBirth
              // You may want to use a DatePicker for a better user experience
              setState(() {
                adminroleData =
                    adminroleData.copyWith(dateOfBirth: DateTime.parse(value));
              });
            },
          ),
          IschoolerTextField(
            initialValue: adminroleData.phoneNumber,
            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onChanged: (value) {
              setState(() {
                adminroleData = adminroleData.copyWith(phoneNumber: value);
              });
            },
          ),
          IschoolerTextField(
            initialValue: adminroleData.address,
            labelText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                adminroleData = adminroleData.copyWith(address: value);
              });
            },
          ), */
          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
        ],
      ),
    );
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSaved(adminroleData);
    }
  }
}
