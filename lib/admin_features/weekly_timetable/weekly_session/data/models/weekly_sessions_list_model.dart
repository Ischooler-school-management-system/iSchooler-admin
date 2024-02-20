// ignore_for_file: use_super_parameters, overridden_fields

import '../../../data/models/weekly_timetable_model.dart';
import 'weekly_session_model.dart';
import '../../../../../../../../common/educonnect_model.dart';
import '../../../../../../../../common/functions/educonnect_date_time_helper.dart';
import '../../../../../../../../common/madpoly.dart';

class WeeklySessionsListModel extends EduconnectListModel {
  const WeeklySessionsListModel({
    required List<WeeklySessionModel> items,
  }) : super(items: items);

  factory WeeklySessionsListModel.empty() {
    return const WeeklySessionsListModel(items: []);
  }
  factory WeeklySessionsListModel.dummy() {
    return WeeklySessionsListModel(items: [
      WeeklySessionModel.dummy(),
      WeeklySessionModel.dummy(),
      WeeklySessionModel.dummy(),
      WeeklySessionModel.dummy(),
    ]);
  }
  WeeklySessionsListModel setSessionsTiming(
      {required WeeklyTimetableModel timeTable}) {
    List<WeeklySessionModel> newItems = [];
    DateTime firstSessionDate = DateTime(5000, 1, 1, timeTable.startTime);
    DateTime startingDate = firstSessionDate.copyWith();
    DateTime endingDate = firstSessionDate
        .copyWith()
        .add(Duration(minutes: timeTable.sessionInterval));
    for (var index = 0; index < items.length; index++) {
      // EduconnectDateTimeHelper.timeFormat(
      EduconnectModel item = items[index];
      if (item is WeeklySessionModel) {
        String? startingTime =
            EduconnectDateTimeHelper.timeFormat(startingDate);
        String? endingtime = EduconnectDateTimeHelper.timeFormat(endingDate);
        Madpoly.print(
          'startingTime = $startingTime, '
          'endingtime = $endingtime',
          tag: 'weekly_sessions_list_model > setSessionsTiming',
          developer: "Ziad",
        );
        newItems.add(
          (item).copyWith(
            startTime: startingTime,
            endTime: endingtime,
          ),
        );
        startingDate = endingDate
            .copyWith()
            .add(Duration(minutes: timeTable.breakInterval));
        endingDate = startingDate
            .copyWith()
            .add(Duration(minutes: timeTable.sessionInterval));
      }
    }
    return WeeklySessionsListModel(items: newItems);
  }

  factory WeeklySessionsListModel.fromMap(Map map) {
    final List<WeeklySessionModel> items = List<WeeklySessionModel>.from(
      map['items'].map(
        (item) => WeeklySessionModel.fromMap(item),
      ),
    );
    return WeeklySessionsListModel(items: items);
  }
}
