import 'package:flutter/material.dart';

import '../../../../../../common/features/responsive/responsive.dart';
import '../../../../educonnect_dashboard_record.dart';
import '../../../data/models/admin_model.dart';

/* 
class AllAdminsWebVeiw extends StatelessWidget {
  final List<AdminModel> adminsList;
  const AllAdminsWebVeiw({super.key, required this.adminsList});

  @override
  Widget build(BuildContext context) {
    var limit = AdminModel.empty().toDisplayMap().length;
    if (Responsive.isCustomWidth(width: 1200)) {
      limit = 6;
    }
    if (Responsive.isCustomWidth(width: 1000)) {
      limit = 4;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EduconnectDashboardRecord(
          map: AdminModel.empty().toDisplayMap(limit: limit),
          isEven: false,
          viewKeys: true,
        ),
        ...adminsList.asMap().entries.map(
          (entry) {
            final AdminModel user = entry.value;
            final index = entry.key;
            final isEven = index % 2 == 0;
            return EduconnectDashboardRecord(
              map: user.toDisplayMap(limit: limit),
              isEven: isEven,
            );
          },
        ),
      ],
    );
  }
}
 */
class AllUsersWebVeiw extends StatelessWidget {
  final List<Map> adminsList;
  const AllUsersWebVeiw({super.key, required this.adminsList});

  @override
  Widget build(BuildContext context) {
    /* var limit = AdminModel.empty().toDisplayMap().length;
    if (Responsive.isCustomWidth(width: 1200)) {
      limit = 6;
    }
    if (Responsive.isCustomWidth(width: 1000)) {
      limit = 4;
    }
 */
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (adminsList.isNotEmpty)
          EduconnectDashboardRecord(
            map: adminsList[0],
            isEven: false,
            viewKeys: true,
          ),
        if (adminsList.isNotEmpty)
          ...adminsList.asMap().entries.map(
            (entry) {
              final user = entry.value;
              final index = entry.key;
              final isEven = index % 2 == 0;
              return EduconnectDashboardRecord(
                map: user,
                isEven: isEven,
              );
            },
          ),
      ],
    );
  }
}
