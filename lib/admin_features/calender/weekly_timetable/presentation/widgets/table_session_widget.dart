import 'package:flutter/material.dart';

import '../../../../../common/common_features/widgets/ischooler_timeline_tile.dart';
import '../../../../../common/functions/ischooler_date_time_helper.dart';
import '../../../../../common/style/ischooler_colors.dart';
import '../../../../../common/style/ischooler_text_theme.dart';
import '../../../weekly_session/data/models/weekly_session_model.dart';

class TableSessionWidget extends StatelessWidget {
  final WeeklySessionModel session;
  // final bool hasIndicator;
  final bool isFirst;
  final bool isLast;
  const TableSessionWidget({
    super.key,
    required this.session,
    // this.hasIndicator = true,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IschoolerTimelineTile(
      // hasIndicator: hasIndicator,
      isFirst: isFirst,
      isLast: isLast,
      endChild: Container(
        decoration: BoxDecoration(
          color: IschoolerColors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(8),
        child: ListTile(
          title: Text(session.instructorAssignment.subjectModel!.name),
          subtitle: Text(session.instructorAssignment.instructor!.name),
        ),
      ),
      startChild: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              IschoolerDateAndTimeHelper.timeOfDayToString(session.startTime),
              style: IschoolerTextStyles.style14
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              IschoolerDateAndTimeHelper.timeOfDayToString(session.endTime),
              style: IschoolerTextStyles.style12Blue
                  .copyWith(color: IschoolerColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
