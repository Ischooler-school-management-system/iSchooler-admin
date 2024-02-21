import 'package:flutter/material.dart';

import '../../../../../common/common_features/widgets/educonnect_date_field.dart';
import '../../../../../common/common_features/widgets/educonnect_drop_down_widget.dart';
import '../../../../../common/common_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_assets.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_time_helper.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../admin_roles/data/models/admin_role_model.dart';
import '../../../admin_roles/logic/cubit/admin_roles_list_cubit.dart';
import '../../../user_model.dart';
import '../../data/models/admin_model.dart';

class AdminDetailsForm extends StatefulWidget {
  final AdminModel? currentAdminData;
  final Function(AdminModel model) onSaved;

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
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(EduconnectAssets.blankProfileImage),
            ),
          ),

          /// name
          EduconnectTextField(
            initialValue: adminData.name,
            labelText: 'Name',
            validator: EduconnectValidations.nameValidator,
            onSaved: (value) {
              adminData = adminData.copyWith(name: value);
              // setState(() {});
            },
          ),

          /// Email Address
          EduconnectTextField(
            // initialValue: 'test',
            initialValue: adminData.email,

            labelText: 'Email Address',

            validator: EduconnectValidations.emailValidator,

            onSaved: (value) {
              adminData = adminData.copyWith(email: value);
              // setState(() {});
            },
          ),

          /// Date of Birth
          EduconnectDateField(
            initialValue:
                EduconnectDateTimeHelper.dateFormat(adminData.dateOfBirth),
            labelText: 'Date of Birth',
            onTap: (date) {
              adminData = adminData.copyWith(dateOfBirth: date);
              setState(() {});
            },
          ),
          //  Todo: create a ui to select user gender
          /// Gender
          EduConnectDropdownWidget(
            labelText: 'Gender',
            // value: ,
            hint: adminData.gender,
            onChanged: (value) {
              Madpoly.print(
                'gender after update = ',
                inspectObject: value,
                tag: 'user_details_form > ',
                developer: "Ziad",
              );
              adminData = adminData.copyWith(gender: value);
              setState(() {});
            },
            options: const ['Male', 'Female'],
          ),

          /* /// Role
          EduConnectDropdownWidget(
            labelText: 'Role',
            // value: ,
            hint: adminData.role.name,
            onChanged: (value) {
              setState(() {
                adminData = adminData.copyWith(gender: value);
              });
            },
            options: const ['Admin', 'Instructor', 'Student'],
          ),
 */
          /// Phone Number
          EduconnectTextField(
            keyboardType: TextInputType.number,
            // initialValue: '01111',
            initialValue: adminData.phoneNumber,

            labelText: 'Phone Number',
            validator: (value) {
              // Add phone number validation if needed
              return null;
            },
            onSaved: (value) {
              adminData = adminData.copyWith(phoneNumber: value);
              // setState(() {});
            },
          ),

          /// Address
          EduconnectTextField(
            initialValue: adminData.address,

            // initialValue: 'test',
            labelText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
            onSaved: (value) {
              adminData = adminData.copyWith(address: value);
              // setState(() {});
            },
          ),

          /// Admin Role

          //  Todo: create AdminRoles logic folder

          DashboardDropDownWidget<AdminRolesListCubit>(
              hint: adminData.adminRole.name,
              labelText: 'Class',
              onChanged: (EduconnectModel value) {
                Madpoly.print(
                  'class model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<AdminRolesListCubit>',
                  developer: "Ziad",
                );
                adminData =
                    adminData.copyWith(adminRole: value as AdminRoleModel);
                setState(() {});
              }),

          /// specialization
          EduconnectTextField(
            initialValue: adminData.specialization,
            labelText: 'Specialization',
            validator: EduconnectValidations.nameValidator,
            onSaved: (value) {
              adminData = adminData.copyWith(specialization: value);
              // setState(() {});
            },
          ),

          /// hireDate
          EduconnectDateField(
            initialValue:
                EduconnectDateTimeHelper.dateFormat(adminData.dateOfBirth),
            labelText: 'Hire Date',
            onTap: (date) {
              adminData = adminData.copyWith(hireDate: date);
              setState(() {});
            },
          ),
          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
        ],
      ),
    );
  }

  onadminDataSaved(UserModel user) {
    adminData = adminData.copyFromUser(user);
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSaved(adminData);
    }
  }
}
