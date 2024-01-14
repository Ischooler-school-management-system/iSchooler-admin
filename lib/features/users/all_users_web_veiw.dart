import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'admins/presentation/screens/all_studdents_views/dashboard_data_row.dart';
import 'all_users_model.dart';
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
            label: DashboardDataRow.textCellWidget(key),
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
        onDeletePressed: () =>
            SmartDialog.showToast('$index,id = ${user.id}, Delete'),
        onEditPressed: () => SmartDialog.showToast('$index, Edit'),
      );
    }).toList();
  }
}
