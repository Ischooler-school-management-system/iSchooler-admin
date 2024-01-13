import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../../common/educonnect_assets.dart';
import '../../../../../../common/educonnect_constants.dart';
import '../../../../../../common/features/widgets/educonnect_image_widget.dart';
import '../../../../../../common/style/educonnect_colors.dart';
import 'dashboard_data_row.dart';

class AllUsersWebVeiw extends StatelessWidget {
  final List<Map<String, dynamic>> usersList;
  const AllUsersWebVeiw({super.key, required this.usersList});

  @override
  Widget build(BuildContext context) {
    // return old();

    if (usersList.isNotEmpty) {
      return SizedBox(
        width: double.infinity,
        child: DataTable(
          columns: _buildColumns(usersList),
          rows: _buildRows(usersList),
          columnSpacing: 8.0,
          horizontalMargin: 0,
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  List<DataColumn> _buildColumns(List<Map<String, dynamic>> data) {
    if (data.isEmpty) {
      return [];
    }

    // Assuming the keys in the first map represent the column names
    var list = data.first.keys
        .map(
          (key) => DataColumn(
            numeric: true,
            label: DashboardDataRow.cellWidget(key),
          ),
        )
        .toList();
    return [
      ...list,
      const DataColumn(numeric: true, label: Text('edit')),
      const DataColumn(numeric: true, label: Text('delete')),
    ];
  }

  List<DataRow> _buildRows(List<Map<String, dynamic>> mapList) {
    return mapList
        .asMap()
        .entries
        .map((MapEntry<int, Map<String, dynamic>> entry) {
      final int index = entry.key;
      final Map<String, dynamic> map = entry.value;
      final bool isEven = index % 2 == 0;
      // Add the edit and delete buttons in the trailing section
      return DashboardDataRow.buildDataRow(
        isEven: isEven,
        map: map,
        /*  onSelectChanged: (selected) {
          SmartDialog.showToast('$index,$selected');
          if (selected != null && selected) {
            // Handle row selection, e.g., show a dialog or navigate to edit screen
          }
        }, */
        // onDeletePressed: () => SmartDialog.showToast(
        //     '$index,id = ${map[EduconnectConstants.localization().id]}, Delete'),
        // onEditPressed: () => SmartDialog.showToast('$index, Edit'),
      );
    }).toList();
  }
}
