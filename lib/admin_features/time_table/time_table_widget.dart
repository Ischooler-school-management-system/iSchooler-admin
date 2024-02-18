import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../common/comon_features/widgets/educonnect_drop_down_widget.dart';
import '../../common/comon_features/widgets/educonnect_screen.dart';
import '../../common/functions/educonnect_date_time_helper.dart';
import '../../common/style/educonnect_colors.dart';
import '../../common/style/educonnect_text_theme.dart';

class ScheduledClass {
  String dateTime;
  String subjectName;
  String instructorName;

  ScheduledClass(this.dateTime, this.subjectName, this.instructorName);
}

List<ScheduledClass> generateClassList(DateTime startingDateTime, int count,
    Duration step, String subject, String instructor) {
  List<ScheduledClass> result = [];
  for (int i = 0; i < count; i++) {
    DateTime classDateTime = startingDateTime.add(step * i);
    result.add(ScheduledClass(
      EduconnectDateTimeHelper.timeFormat(classDateTime) ?? '',
      subject,
      instructor,
    ));
  }
  return result;
}

class TimeTableScreen extends StatelessWidget {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ScheduledClass> sessionList = generateClassList(
        DateTime.now(), 9, const Duration(minutes: 30), "Math", "John Doe");

    return EduconnectScreen(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            EduConnectDropdownWidget(
              labelText: 'day',
              // value: ,
              hint: 'Monday',
              onChanged: (value) {},
              options: const [
                'Sunday',
                'Monday',
                'Tuesday',
                'Wensday',
                'Thursday'
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sessionList.length,
                itemBuilder: (BuildContext context, int index) {
                  return newMethod(
                    session: sessionList[index],
                    isFirst: index == 0,
                    isLast: index == sessionList.length - 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TimelineTile newMethod({
    required ScheduledClass session,
    hasIndicator = true,
    bool isFirst = false,
    bool isLast = false,
  }) {
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
          title: Text(session.subjectName),
          subtitle: Text(session.instructorName),
          /*  trailing: EduconnectButton(
            button: EduconnectContainerButton(
              onPressed: () {},
              child: const Icon(
                Icons.more_vert_outlined,
              ),
            ),
          ), */
        ),
      ),
      startChild: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              session.dateTime,
              style: EduconnectTextStyles.style14
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              session.dateTime,
              style: EduconnectTextStyles.style12Blue
                  .copyWith(color: EduconnectColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
