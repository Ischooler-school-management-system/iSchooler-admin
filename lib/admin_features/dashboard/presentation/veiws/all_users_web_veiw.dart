import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../common/educonnect_model.dart';
import '../../../../common/madpoly.dart';
import '../../../users/admins/data/models/admin_model.dart';
import '../../../users/admins/presentation/screens/admin_details_screen.dart';
import '../../../users/admins/presentation/screens/all_admins_views/dashboard_data_row.dart';
import '../../../users/students/data/models/student_model.dart';
import '../../../users/students/presentation/screens/student_details_screen.dart';
import '../../../users/user_model.dart';

class AllUsersWebVeiw extends StatelessWidget {
  final EduconnectAllModel allUsers;
  const AllUsersWebVeiw({super.key, required this.allUsers});

  @override
  Widget build(BuildContext context) {
    // return old();

    if (allUsers.items.isNotEmpty) {
      return DataTable2(
        columns: _buildColumns(),
        rows: _buildRows(),

        // columnSpacing: 8.0,
        horizontalMargin: 0,
      );
    } else {
      return Container();
    }
  }

  List<DataColumn2> _buildColumns() {
    if (allUsers.items.isEmpty) {
      return [];
    }

    // Assuming the keys in the first map represent the column names
    var list = allUsers
        .toDisplayList()
        .first
        .keys
        .map(
          (key) => DataColumn2(
            size: ColumnSize.L,
            // numeric: true,
            label: Center(
              child: Text(
                key,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        )
        .toList();
    List<DataColumn2> columnList = [
      ...list,
      const DataColumn2(
          size: ColumnSize.S, /* numeric: true, */ label: Text('edit')),
      const DataColumn2(
          size: ColumnSize.S, /* numeric: true, */ label: Text('delete')),
    ];

    return columnList;
  }

  List<DataRow2> _buildRows() {
    Iterable<MapEntry<int, EduconnectModel>> entries2 =
        allUsers.items.asMap().entries;
    List<DataRow2> rowList = entries2.map((entry) {
      final int index = entry.key;
      final EduconnectModel user = allUsers.items[index];
      final EduconnectModel map = entry.value;
      final bool isEven = index % 2 == 0;
      // Add the edit and delete buttons in the trailing section
      return DashboardDataRow2.buildDataRow2(
        isEven: isEven,
        map: map.toDisplayMap(),
        onSelectChanged: (selected) {
          SmartDialog.showToast('$index,$selected');
          if (selected != null && selected) {
            // Handle row selection, e.g., show a dialog or navigate to edit screen
          }
        },
        onDeletePressed: () {
          SmartDialog.showToast('$index,id = ${user.id}, Delete');
        },
        onEditPressed: () {
          SmartDialog.showToast('$index, Edit');
          // EduconnectNavigator.navigateToScreen(edit)
          if (user is UserModel) {
            navigateToUserDetails(user);
          }
        },
      );
    }).toList();

    return rowList;
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
