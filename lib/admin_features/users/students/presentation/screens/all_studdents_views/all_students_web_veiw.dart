import 'package:flutter/material.dart';

import '../../../../../../common/comon_features/responsive/responsive.dart';
import '../../../../../dashboard/presentation/widgets/educonnect_dashboard_record.dart';
import '../../../data/models/student_model.dart';

class AllStudentsWebVeiw extends StatelessWidget {
  final List studentList;
  const AllStudentsWebVeiw({super.key, required this.studentList});

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
        ...studentList.asMap().entries.map(
          (entry) {
            final StudentModel student = entry.value;
            final index = entry.key;
            final isEven = index % 2 == 0;
            // return _valueTextWidget(propertyName, isEven: isEven);

            return EduconnectDashboardRecord(
              map: student.toDisplayMap(limit: limit),
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
