// ignore_for_file: use_super_parameters, overridden_fields

import '../../../weekly_timetable/data/models/weekly_timetable_model.dart';
import 'weekly_session_model.dart';
import '../../../../../../../../common/educonnect_model.dart';
import '../../../../../../../../common/functions/educonnect_date_time_helper.dart';
import '../../../../../../../../common/madpoly.dart';

class WeeklySessionsListModel extends IschoolerListModel {
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
    DateTime firstSessionDate = timeTable.startTime;
    DateTime startingDate = firstSessionDate.copyWith();
    DateTime endingDate = firstSessionDate
        .copyWith()
        .add(Duration(minutes: timeTable.sessionInterval));
    for (var index = 0; index < items.length; index++) {
      // IschoolerDateTimeHelper.timeFormat(
      IschoolerModel item = items[index];
      if (item is WeeklySessionModel) {
        String? startingTime = IschoolerDateTimeHelper.timeFormat(startingDate);
        String? endingtime = IschoolerDateTimeHelper.timeFormat(endingDate);
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
