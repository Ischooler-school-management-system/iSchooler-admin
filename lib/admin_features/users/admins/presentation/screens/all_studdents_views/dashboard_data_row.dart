import 'package:flutter/material.dart';

import '../../../../../../common/educonnect_assets.dart';
import '../../../../../../common/style/educonnect_colors.dart';

class DashboardDataRow {
  /// I couldn't make it a statlesswidget because of this error:
  /// !A value of type 'DataRow' can't be returned from the method 'build' because it has a return type of 'Widget'.
  static DataRow buildDataRow({
    bool isEven = false,
    required Map<String, dynamic> map,
    Function(bool?)? onSelectChanged,
    Function()? onEditPressed,
    Function()? onDeletePressed,
  }) {
    return DataRow(
      onSelectChanged: onSelectChanged,
      color: MaterialStatePropertyAll(
        isEven ? EduconnectColors.blue.withOpacity(0.3) : null,
      ),
      cells: [
        ...map.entries.map((MapEntry<String, dynamic> map) {
          // bool isName = map.key == EduconnectConstants.localization().name;

          return DataCell(map.value != ''
              ? textCellWidget(map.value)
              : imageCellWidget(map.value));
        }),
        /*   DataCell(
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
        ), */
      ],
    );
  }

  static Widget textCellWidget(String value) {
    // return EduconnecDashboardListTile(title: value, isName: isName);

    return Align(
      alignment: Alignment.center,
      child: Text(
        value,
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget imageCellWidget(String value) {
    // return EduconnecDashboardListTile(title: value, isName: isName);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage(EduconnectAssets.blankProfileImage),
        ),
        /* EduconnectImageWidget.asset(
          url: EduconnectAssets.blankProfileImage,
          // circleShape: true,
          width: 60,
        ), */
      ),
    );
  }
}
