import 'package:flutter/material.dart';

import '../../../../../../common/features/widgets/educonnect_small_view.dart';
import '../../../../../../common/madpoly.dart';
import '../../../../educonnect_dashboard_listtile.dart';
import '../../../data/models/admin_model.dart';

class AllAdminsMobileVeiw extends StatelessWidget {
  final List<AdminModel> adminsList;
  const AllAdminsMobileVeiw({super.key, required this.adminsList});

  @override
  Widget build(BuildContext context) {
    return EduconnectSmallView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...adminsList.map(
            (admin) {
              return EduconnecDashboardListTile(
                title: admin.displayName,
                isName: true,
                subtitle: '${admin.gender} | ${admin.phoneNumber}',
                trailing: SizedBox(
                  width: 80,
                  child: Row(
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
              );

              /* return EduconnecDashboardListTile(
                title: admin.displayName,
              ); */
            },
          ),
        ],
      ),
    );
  }
}