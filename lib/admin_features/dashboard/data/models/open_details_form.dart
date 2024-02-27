/* import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../common/madpoly.dart';
import '../../../users/admins/data/models/admin_model.dart';
import '../../../users/admins/presentation/widgets/admi_details_form.dart';
import '../../../users/students/data/models/student_model.dart';
import '../../../users/user_model.dart';
import '../../presentation/screens/dashboard_details_screen.dart';

navigateToUserDetails(UserModel user) {
  switch (user.role) {
    case UserRole.admin:
      {}

      SmartDialog.show(
        alignment: Alignment.center,
        builder: (context) =>
            AdminDetailsForm(currentAdminData: user as AdminModel),
      );
    case UserRole.student:
      SmartDialog.show(
        alignment: Alignment.center,
        builder: (context) =>
            DashboardDetailsScreen(currentData: user as StudentModel),
      );
    default:
      Madpoly.print(
        'the role: ${user.role.name} is not a valid role',
        tag: 'all_users_web_view > ',
        developer: "Ziad",
      );
  }
}
 */