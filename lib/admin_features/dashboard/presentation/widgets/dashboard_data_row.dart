import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../common/ischooler_assets.dart';
import '../../../../common/ischooler_constants.dart';
import '../../../../common/style/ischooler_colors.dart';

class DashboardDataRow2 {
  /// I couldn't make it a statlesswidget because of this error:
  /// A value of type 'DataRow2' can't be returned from the method 'build' because it has a return type of 'Widget'.
  static DataRow2 buildDataRow2({
    bool isEven = false,
    required Map<String, dynamic> map,
    Function(bool?)? onSelectChanged,
    Function()? onEditPressed,
    Function()? onDeletePressed,
  }) {
    return DataRow2(
      onSelectChanged: onSelectChanged,
      color: MaterialStatePropertyAll(
        isEven ? IschoolerColors.blue.withOpacity(0.3) : null,
      ),
      cells: [
        ...map.entries.map((MapEntry<String, dynamic> map) {
          bool isName = map.key == IschoolerConstants.localization().name;

          return DataCell(
              isName ? imageCellWidget(map.value) : textCellWidget(map.value));
        }),
        DataCell(
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEditPressed,
          ),
        ),
        DataCell(
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: onDeletePressed,
          ),
        ),
      ],
    );
  }

  static Widget textCellWidget(String value) {
    // return EduconnecDashboardListTile(title: value, isName: isName);

    return Text(
      value,
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Widget imageCellWidget(String value) {
    // return EduconnecDashboardListTile(title: value, isName: isName);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(IschoolerAssets.blankProfileImage),
          ),

          /* IschoolerImageWidget.asset(
            url: IschoolerAssets.blankProfileImage,
            // circleShape: true,
            width: 60,
          ), */
        ),
        Expanded(
          // width: 60,
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
}
