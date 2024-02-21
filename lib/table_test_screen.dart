import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'admin_features/dashboard/presentation/views/dashboard_web_view.dart';
import 'admin_features/dashboard/presentation/widgets/dashboard_data_row.dart';
import 'admin_features/users/students/data/models/student_model.dart';
import 'admin_features/users/students/data/models/students_list_model.dart';
import 'admin_features/users/user_model.dart';
import 'common/common_features/widgets/educonnect_screen.dart';
import 'common/madpoly.dart';

// ignore: must_be_immutable
class TableTestScreen extends StatelessWidget {
  TableTestScreen({super.key});

  StudentsListModel allUsers = StudentsListModel(
    items: List.generate(60, (index) => StudentModel.dummy()),
  );
  List<Map<String, dynamic>> dataList = [];
  @override
  Widget build(BuildContext context) {
    /* final List<Map<String, dynamic>> dataList = [
      {'Name': 'John', 'Age': 25, 'City': 'New York'},
      {'Name': 'Alice', 'Age': 30, 'City': 'Los Angeles'},
      {'Name': 'Bob', 'Age': 22, 'City': 'Chicago'},
    ]; */
    dataList = allUsers.toDisplayList();
    Madpoly.print(
      'building',
      tag: 'test_screen > ',
      developer: "Ziad",
    );

    if (dataList.isEmpty) {
      // Handle the case when the list is empty
      return const Center(child: Text('No data available.'));
    }

    return EduconnectScreen(
      // keepMobileView: true,
      // alignment: Alignment.center,
      // body: tableBody(),
      // body: buildDataTable(),
      body: Column(
        children: [
          Expanded(child: DashboardWebview(allUsers: allUsers)),
        ],
      ),
    );
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
    return [
      ...list,
      // const DataColumn(numeric: true, label: Text('edit')),
      // const DataColumn(numeric: true, label: Text('delete')),
    ];
  }

  Widget buildDataTable() {
    // Define columns for the data table
    List<DataColumn> columns = _buildColumns();

    // Build the data rows
    Iterable<MapEntry<int, UserModel>> entries2 = [];
    // allUsers.items.asMap().entries;

    List<DataRow> rows = entries2
        .map((MapEntry<int, UserModel> map) =>
            DashboardDataRow2.buildDataRow2(map: map.value.toDisplayMap()))
        .toList();
    /*  List<DataRow> rows = data.map((Map<String, dynamic> rowData) {
      List<DataCell> cells = rowData.values
          .map(
            (dynamic value) => DataCell(
              Center(
                child: Text(
                  value.toString(),
                ),
              ),
            ),
          )
          .toList();
      return DataRow(cells: cells);
    }).toList();
 */
    // Return the data table widget
    return DataTable2(
      columns: columns,
      rows: rows,
      columnSpacing: 12.0,
      horizontalMargin: 12.0,
      minWidth: 600,

      // border: TableBorder.all(),
      showCheckboxColumn: false, // Set to true if you want checkboxes
      // onRefresh: () async {
      // Implement refresh logic if needed
      // },
    );
  }
}
