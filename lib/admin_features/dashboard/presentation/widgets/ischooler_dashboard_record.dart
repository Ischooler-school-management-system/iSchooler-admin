// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../common/common_features/widgets/buttons/ischooler_button.dart';
import '../../../../common/common_features/widgets/buttons/models/buttons_model.dart';
import '../../../../common/ischooler_constants.dart';
import '../../../../common/style/ischooler_colors.dart';
import 'ischooler_dashboard_listtile.dart';

class IschoolerDashboardRecord extends StatelessWidget {
  final Map map;
  final bool isEven;
  final bool viewKeys;
  final Function()? onPressed;
  const IschoolerDashboardRecord({
    super.key,
    required this.map,
    required this.isEven,
    this.viewKeys = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IschoolerButton(
      button: IschoolerContainerButton(
        child: ListTile(
          tileColor: isEven ? IschoolerColors.blue.withOpacity(0.3) : null,
          contentPadding: EdgeInsets.zero,
          title: recordWidget(map, showKeys: viewKeys),
          trailing: viewKeys
              ? const SizedBox(width: 80)
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
        ),
        onPressed: () {},
      ),
      // onPressed: onPressed,
    );
  }

// this widget takes the map add show its items in a row
// if the showkeys is true it shows keys and if not it shows values
  Widget recordWidget(Map childernsMap, {bool showKeys = false}) {
    return Row(
      children: map.entries.map((MapEntry entry) {
        if (viewKeys) {
          return EduconnecDashboardListTile(
            title: entry.key,
          );
        } else {
          return EduconnecDashboardListTile(
            title: entry.value.toString(),
            isName: entry.key == IschoolerConstants.localization().name,
          );
        }
      }).toList(),
    );
  }
}
