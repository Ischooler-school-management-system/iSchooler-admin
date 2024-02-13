// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:school_admin/common/comon_features/widgets/educonnect_date_field.dart';

import '../../../../../common/comon_features/widgets/educonnect_drop_down_widget.dart';
import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_time_helper.dart';
import '../../common/educonnect_assets.dart';
import 'user_model.dart';

class UserDetailsForm extends StatefulWidget {
  final UserModel? currentUserData;
  final Function(UserModel model) onSaved;
  final GlobalKey<FormState> formKey;

  // final GlobalKey<FormState> formKey;
  const UserDetailsForm({
    // required this.formKey,
    super.key,
    this.currentUserData,
    required this.onSaved,
    required this.formKey,
  });

  @override
  State<UserDetailsForm> createState() => _StudentDetailsFormState();
}

class _StudentDetailsFormState extends State<UserDetailsForm> {
  // Use Usermodel to store form data

  // UserModel studentData = UserModel.empty();
  UserModel userData = UserModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentUserData != null;
    if (editingModel) {
      userData = widget.currentUserData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      onChanged: onSubmitButtonPressed,
      child: Column(
        children: [
          /// image
          //  Todo: create a ui to select user image
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(EduconnectAssets.blankProfileImage),
            ),
          ),

          /// name
          EduconnectTextField(
            initialValue: userData.name,
            labelText: 'Name',
            validator: EduconnectValidations.nameValidator,
            onSaved: (value) {
              userData = userData.copyWith(name: value);
              // setState(() {});
            },
          ),

          /// Email Address
          EduconnectTextField(
            // initialValue: 'test',
            initialValue: userData.email,

            labelText: 'Email Address',

            validator: EduconnectValidations.emailValidator,

            onSaved: (value) {
              userData = userData.copyWith(email: value);
              // setState(() {});
            },
          ),

          /// Date of Birth
          EduconnectDateField(
            initialValue: EduconnectDateTimeHelper.format(userData.dateOfBirth),
            labelText: 'Date of Birth',
            onTap: (date) {
              userData = userData.copyWith(dateOfBirth: date);
              setState(() {});
            },
          ),
          //  Todo: create a ui to select user gender
          /// Gender
          EduConnectDropdownWidget(
            labelText: 'Gender',
            // value: ,
            hint: userData.gender,
            onChanged: (value) {
              setState(() {
                userData = userData.copyWith(gender: value);
              });
            },
            options: const ['Male', 'Female'],
          ),

          /// Role
          EduConnectDropdownWidget(
            labelText: 'Role',
            // value: ,
            hint: userData.role.name,
            onChanged: (value) {
              setState(() {
                userData = userData.copyWith(gender: value);
              });
            },
            options: const ['Admin', 'Instructor', 'Student'],
          ),

          /// Phone Number
          EduconnectTextField(
            // initialValue: '01111',
            initialValue: userData.phoneNumber,

            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onSaved: (value) {
              userData = userData.copyWith(phoneNumber: value);
              // setState(() {});
            },
          ),

          /// Address
          EduconnectTextField(
            initialValue: userData.address,

            // initialValue: 'test',
            labelText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onSaved: (value) {
              userData = userData.copyWith(address: value);
              // setState(() {});
            },
          ),
        ],
      ),
    );
  }

  onSubmitButtonPressed() {
    // if (widget.formKey.currentState!.validate()) {
    widget.formKey.currentState!.save();

    widget.onSaved(userData);
    // }
  }
}
