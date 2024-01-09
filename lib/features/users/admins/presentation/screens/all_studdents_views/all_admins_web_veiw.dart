import 'package:flutter/material.dart';

import '../../../../../../common/features/responsive/responsive.dart';
import '../../../../educonnect_dashboard_record.dart';
import '../../../data/models/admin_model.dart';

class AllAdminsWebVeiw extends StatelessWidget {
  final List<AdminModel> adminsList;
  const AllAdminsWebVeiw({super.key, required this.adminsList});

  @override
  Widget build(BuildContext context) {
    var limit = AdminModel.empty().toDisplayMap().length;
    if (Responsive.isCustomWidth(width: 1200) && limit >= 8) {
      limit -= 2;
    } else if (Responsive.isCustomWidth(width: 1000) && limit >= 6) {
      limit -= 2;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // addButton(),
        // EduconnectConditionalWidget(
        // condition: Responsive.isMobile(),
        // whenTrue: listTileVeiw(),
        EduconnectDashboardRecord(
          map: AdminModel.empty().toDisplayMap(
            limit: limit,
          ),
          isEven: false,
          viewKeys: true,
        ),
        // Column(
        ...adminsList.asMap().entries.map(
          (entry) {
            final AdminModel admin = entry.value;
            final index = entry.key;
            final isEven = index % 2 == 0;
            // return _valueTextWidget(propertyName, isEven: isEven);

            return EduconnectDashboardRecord(
              map: admin.toDisplayMap(limit: limit),
              isEven: isEven,
            );
          },
        ),
        // ),
        // ),
      ],
    );
  }
}
