import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../common/ischooler_model.dart';
import '../widgets/dashboard_data_row.dart';

class DashboardWebview extends StatelessWidget {
  final IschoolerListModel allUsers;
  final Function(IschoolerModel model)? onDeleteButtonPressed;
  final Function(IschoolerModel model)? onEditButtonPressed;
  const DashboardWebview(
      {super.key,
      required this.allUsers,
      this.onDeleteButtonPressed,
      this.onEditButtonPressed});

  @override
  Widget build(BuildContext context) {
    // return old();

    if (allUsers.items.isNotEmpty) {
      return Expanded(
        child: DataTable2(
          // source
          columns: _buildColumns(),
          rows: _buildRows(),
          border: TableBorder.all(),

          // columnSpacing: 8.0,
          // horizontalMargin: 0,
          lmRatio: 2,
        ),
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
            // size: ColumnSize.L,
            numeric: true,
            label: Text(
              key,
              maxLines: 1,
              // textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
        .toList();
    List<DataColumn2> columnList = [
      ...list,
      const DataColumn2(numeric: true, label: Text('edit')),
      const DataColumn2(numeric: true, label: Text('delete')),
    ];

    return columnList;
  }

  List<DataRow2> _buildRows() {
    Iterable<MapEntry<int, IschoolerModel>> entries2 =
        allUsers.items.asMap().entries;
    List<DataRow2> rowList = entries2.map((entry) {
      final int index = entry.key;
      final IschoolerModel data = allUsers.items[index];
      final IschoolerModel map = entry.value;
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
        onEditPressed: onEditButtonPressed == null
            ? null
            : () => onEditButtonPressed!(data),
        onDeletePressed: onDeleteButtonPressed == null
            ? null
            : () => onDeleteButtonPressed!(data),
      );
    }).toList();

    return rowList;
  }
}
