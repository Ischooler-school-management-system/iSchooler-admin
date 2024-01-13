import 'package:flutter/material.dart';

import '../../../../../../common/educonnect_assets.dart';
import '../../../../../../common/educonnect_constants.dart';
import '../../../../../../common/features/widgets/educonnect_image_widget.dart';
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

          return DataCell(cellWidget(map.value, isName: false));
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

  static Widget cellWidget(String value, {bool isName = false}) {
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
