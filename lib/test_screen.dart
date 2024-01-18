import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'admin_features/users/admins/data/models/admin_model.dart';
import 'admin_features/users/admins/data/models/all_admins_model.dart';
import 'admin_features/users/admins/presentation/screens/all_studdents_views/dashboard_data_row.dart';
import 'admin_features/users/user_model.dart';
import 'common/comon_features/widgets/educonnect_screen.dart';
import 'common/educonnect_assets.dart';
import 'common/madpoly.dart';
import 'common/style/educonnect_colors.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  AllAdminsModel allUsers = AllAdminsModel(
    items: List.generate(
      60,
      (index) => AdminModel(
        profilePicture: '',
        id: '$index',
        displayName: 'Joe allawi habib galbi',
        userName: 'JohnDoe',
        dateOfBirth: DateTime(2000, 1, 1),
        phoneNumber: '1234567890',
        address: '123 Main St',
        gender: 'Male',
        email: 'ziad@mail.com',
      ),
    ),
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
      body: buildDataTable(dataList),
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

  Widget buildDataTable(List<Map<String, dynamic>> data) {
    // Define columns for the data table
    List<DataColumn> columns = _buildColumns();

    // Build the data rows

    List<DataRow> rows =
        data.map((map) => DashboardDataRow.buildDataRow(map: map)).toList();
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
