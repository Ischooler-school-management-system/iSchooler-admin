import 'package:flutter/material.dart';

import '../../../../../common/comon_features/widgets/educonnect_date_field.dart';
import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_time_helper.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../user_details_form.dart';
import '../../../user_model.dart';
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
  final GlobalKey<FormState> _userFormKey = GlobalKey<FormState>();
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
          UserDetailsForm(
            currentUserData: adminData,
            onSaved: onUserDataSaved,
            formKey: _userFormKey,
          ),

          /// Admin Role
          // to view role until cubit is created
          EduconnectTextField(
            initialValue: adminData.adminRole.name,
            labelText: 'Admin Role',
            validator: EduconnectValidations.nameValidator,
            /*  onSaved: (value) {
              adminData = adminData.copyWith(adminRole: value);
              // setState(() {});
            }, */
          ),
          //  Todo: create AdminRoles logic folder

          /* DashboardDropDownWidget<AdminRolesListCubit>(
              value: adminData.adminRole.name,
              labelText: 'Class',
              onSaved: (EduconnectModel value) {
                Madpoly.print(
                  'class model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<ClassesListCubit>',
                  developer: "Ziad",
                );
                adminData =
                    adminData.copyWith(adminRole: value as AdminRoleModel);
                setState(() {});
              }),
           */

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
                EduconnectDateTimeHelper.format(adminData.dateOfBirth),
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

  onUserDataSaved(UserModel user) {
    adminData = adminData.copyFromUser(user);
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSaved(adminData);
    }
  }
}
