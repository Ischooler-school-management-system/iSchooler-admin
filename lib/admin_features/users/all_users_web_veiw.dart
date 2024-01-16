import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../common/madpoly.dart';
import '../../common/navigation/router.export.dart';
import 'admins/data/models/admin_model.dart';
import 'admins/presentation/screens/admin_details_screen.dart';
import 'admins/presentation/screens/all_studdents_views/dashboard_data_row.dart';
import 'all_users_model.dart';
import 'students/data/models/student_model.dart';
import 'students/presentation/screens/student_details_screen.dart';
import 'user_model.dart';

class AllUsersWebVeiw extends StatelessWidget {
  final AllUsersModel allUsers;
  const AllUsersWebVeiw({super.key, required this.allUsers});

  @override
  Widget build(BuildContext context) {
    // return old();

    if (allUsers.items.isNotEmpty) {
      return SizedBox(
        width: double.infinity,
        child: DataTable(
          columns: _buildColumns(),
          rows: _buildRows(),
          columnSpacing: 8.0,
          horizontalMargin: 0,
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  List<DataColumn> _buildColumns() {
    if (allUsers.items.isEmpty) {
      return [];
    }

    // Assuming the keys in the first map represent the column names
    var list = allUsers
        .toDisplayList()
        .first
        .keys
        .map(
          (key) => DataColumn(
            numeric: true,
            label: Text(
              key,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
        .toList();
    return [
      ...list,
      const DataColumn(numeric: true, label: Text('edit')),
      const DataColumn(numeric: true, label: Text('delete')),
    ];
  }

  List<DataRow> _buildRows() {
    Iterable<MapEntry<int, UserModel>> entries2 =
        allUsers.items.asMap().entries;
    return entries2.map((entry) {
      final int index = entry.key;
      final UserModel user = allUsers.items[index];
      final UserModel map = entry.value;
      final bool isEven = index % 2 == 0;
      // Add the edit and delete buttons in the trailing section
      return DashboardDataRow.buildDataRow(
        isEven: isEven,
        map: map.toDisplayMap(),
        /*  onSelectChanged: (selected) {
          SmartDialog.showToast('$index,$selected');
          if (selected != null && selected) {
            // Handle row selection, e.g., show a dialog or navigate to edit screen
          }
        }, */
        onDeletePressed: () {
          SmartDialog.showToast('$index,id = ${user.id}, Delete');
        },
        onEditPressed: () {
          SmartDialog.showToast('$index, Edit');
          // EduconnectNavigator.navigateToScreen(edit)
          navigateToUserDetails(user);
        },
      );
    }).toList();
  }
}

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
