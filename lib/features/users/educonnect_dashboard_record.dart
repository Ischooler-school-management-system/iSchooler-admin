// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:school_admin/common/madpoly.dart';

import '../../common/educonnect_constants.dart';
import '../../common/features/widgets/buttons/educonnect_button.dart';
import '../../common/features/widgets/buttons/models/buttons_model.dart';
import '../../common/style/educonnect_colors.dart';
import 'educonnect_dashboard_listtile.dart';

class EduconnectDashboardRecord extends StatelessWidget {
  final Map map;
  final bool isEven;
  final bool viewKeys;
  final Function()? onPressed;
  const EduconnectDashboardRecord({
    super.key,
    required this.map,
    required this.isEven,
    this.viewKeys = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return EduconnectButton(
      button: EduconnectContainerButton(
        child: ListTile(
          tileColor: isEven ? EduconnectColors.blue.withOpacity(0.3) : null,
          contentPadding: EdgeInsets.zero,
          title: newMethod(),
          // onTap: () {},
          trailing: viewKeys
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Handle edit button press
                        Madpoly.print('Edit button pressed for Item ');
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // Handle delete button press
                        Madpoly.print('Delete button pressed for Item ');
                      },
                    ),
                  ],
                ),
        ),
        onPressed: () {},
      ),
      // onPressed: onPressed,
    );
  }

  Container newMethod() {
    return Container(
      // padding: const EdgeInsets.all(8.0),
      child: Row(
        children: map.entries.map((MapEntry entry) {
          if (viewKeys) {
            return EduconnecDashboardListTile(title: entry.key, width: 150);
          } else {
            return EduconnecDashboardListTile(
              title: entry.value.toString(),
              isName: entry.key == EduconnectConstants.localization().name,
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
