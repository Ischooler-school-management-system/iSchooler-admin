import 'package:flutter/material.dart';
import 'package:school_admin/admin_features/weekly_timetable/weekly_session/data/models/weekly_session_model.dart';
import 'package:school_admin/common/style/educonnect_colors.dart';
import 'package:school_admin/common/style/educonnect_text_theme.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TableSessionWidget extends StatelessWidget {
  final WeeklySessionModel session;
  final bool hasIndicator;
  final bool isFirst;
  final bool isLast;
  const TableSessionWidget({
    super.key,
    required this.session,
    this.hasIndicator = true,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      hasIndicator: hasIndicator,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle:
          const IndicatorStyle(width: 10, color: EduconnectColors.blue),
      beforeLineStyle: const LineStyle(color: EduconnectColors.blue),
      alignment: TimelineAlign.manual,
      lineXY: 0.2,
      endChild: Container(
        decoration: BoxDecoration(
          color: EduconnectColors.blue.withOpacity(0.3),
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
              session.startTime,
              style: EduconnectTextStyles.style14
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              session.endTime,
              style: EduconnectTextStyles.style12Blue
                  .copyWith(color: EduconnectColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
