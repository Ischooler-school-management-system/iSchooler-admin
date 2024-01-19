import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../common/madpoly.dart';
import '../../../users/admins/data/models/admin_model.dart';
import '../../../users/admins/presentation/screens/admin_details_screen.dart';
import '../../../users/students/data/models/student_model.dart';
import '../../../users/students/presentation/screens/student_details_screen.dart';
import '../../../users/user_model.dart';

navigateToUserDetails(UserModel user) {
  switch (user.role) {
    case UserRole.admin:
      {}

      SmartDialog.show(
        alignment: Alignment.center,
        builder: (context) =>
            AdminDetailsScreen(currentAdminData: user as AdminModel),
      );
    case UserRole.student:
      SmartDialog.show(
        alignment: Alignment.center,
        builder: (context) =>
            StudentDetailsScreen(currentStudentData: user as StudentModel),
      );
    default:
      Madpoly.print(
        'the role: ${user.role.name} is not a valid role',
        tag: 'all_users_web_veiw > ',
        developer: "Ziad",
      );
  }
}
