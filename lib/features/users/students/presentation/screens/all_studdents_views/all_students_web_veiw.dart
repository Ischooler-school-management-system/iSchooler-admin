import 'package:flutter/material.dart';

import '../../../../../../common/features/responsive/responsive.dart';
import '../../../../educonnect_dashboard_record.dart';
import '../../../data/models/student_model.dart';

class AllStudentsWebVeiw extends StatelessWidget {
  final List userList;
  const AllStudentsWebVeiw({super.key, required this.userList});

  @override
  Widget build(BuildContext context) {
    var limit = StudentModel.empty().toDisplayMap().length;
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
          map: StudentModel.empty().toDisplayMap(
            limit: limit,
          ),
          isEven: false,
          viewKeys: true,
        ),
        // Column(
        ...userList.asMap().entries.map(
          (entry) {
            final StudentModel user = entry.value;
            final index = entry.key;
            final isEven = index % 2 == 0;
            // return _valueTextWidget(propertyName, isEven: isEven);

            return EduconnectDashboardRecord(
              map: user.toDisplayMap(limit: limit),
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
