import 'package:flutter/material.dart';

import '../../common/style/educonnect_colors.dart';
import 'educonnect_dashboard_listtile.dart';

class EduconnectDashboardRecord extends StatelessWidget {
  final Map map;
  final bool isEven;
  final bool viewKeys;
  const EduconnectDashboardRecord({
    super.key,
    required this.map,
    required this.isEven,
    this.viewKeys = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isEven ? EduconnectColors.blue.withOpacity(0.3) : null,
      // padding: const EdgeInsets.all(8.0),
      child: Row(
        children: map.entries.map((MapEntry entry) {
          if (viewKeys) {
            return EduconnecDashboardListTile(title: entry.key, width: 150);
          } else {
            return EduconnecDashboardListTile(
              title: entry.value.toString(),
              isName: entry.key == 'displayName',
              width: 150,
            );
          }
        }).toList(),
      ),
    );
  }

  /*  Widget _valuesRow(
      {required}) {
    return 
  } */
}
