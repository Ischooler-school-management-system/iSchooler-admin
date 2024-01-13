import 'package:flutter/material.dart';

import '../../../../../../common/educonnect_assets.dart';
import '../../../../../../common/educonnect_constants.dart';
import '../../../../../../common/features/widgets/educonnect_image_widget.dart';
import '../../../../../../common/functions/truncate_dashboard_map.dart';
import '../../../../../../common/style/educonnect_colors.dart';
import '../../../../educonnect_dashboard_record.dart';

class AllUsersWebVeiw extends StatelessWidget {
  final List<Map<String, dynamic>> usersList;
  const AllUsersWebVeiw({super.key, required this.usersList});

  @override
  Widget build(BuildContext context) {
    // return old();

    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: _buildColumns(usersList),
        rows: _buildRows(usersList),
        columnSpacing: 8.0,
        horizontalMargin: 0,
      ),
    );
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
            label: cellWidget(key),
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
      return buildDataRow(isEven, map);
    }).toList();
  }

  DataRow buildDataRow(bool isEven, Map<String, dynamic> map) {
    return DataRow(
      color: MaterialStatePropertyAll(
        isEven ? EduconnectColors.blue.withOpacity(0.3) : null,
      ),
      cells: [
        ...map.entries.map((MapEntry<String, dynamic> map) {
          bool isName = map.key == EduconnectConstants.localization().name;

          return DataCell(cellWidget(map.value, isName: isName));
        }),
        DataCell(IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            // Handle edit button click, e.g., show edit dialog or navigate to edit screen
          },
        )),
        DataCell(IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            // Handle delete button click, e.g., show delete confirmation dialog
          },
        )),
      ],
      onSelectChanged: (selected) {
        if (selected != null && selected) {
          // Handle row selection, e.g., show a dialog or navigate to edit screen
        }
      },
    );
  }

  Widget cellWidget(String value, {bool isName = false}) {
    // return EduconnecDashboardListTile(title: value, isName: isName);
    if (isName) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: EduconnectImageWidget.asset(
              url: EduconnectAssets.blankProfileImage,
              circleShape: true,
              width: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              value,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }
    // return Text(value);
    else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
  }
}
