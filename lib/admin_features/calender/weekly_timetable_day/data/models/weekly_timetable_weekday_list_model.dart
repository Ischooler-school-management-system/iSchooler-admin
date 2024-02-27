// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_super_parameters, overridden_fields

import 'package:ischooler_admin/admin_features/calender/weekly_timetable_day/data/models/weekly_timetable_day_model.dart';
import 'package:ischooler_admin/common/ischooler_model.dart';

class WeeklyTimetableWeekdayListModel extends IschoolerListModel {
  const WeeklyTimetableWeekdayListModel({required super.items});

  factory WeeklyTimetableWeekdayListModel.empty() {
    return const WeeklyTimetableWeekdayListModel(items: []);
  }

  factory WeeklyTimetableWeekdayListModel.dummy() {
    return WeeklyTimetableWeekdayListModel(
      items: [
        WeeklyTimetableDayModel.dummy(),
        WeeklyTimetableDayModel.dummy(),
        WeeklyTimetableDayModel.dummy(),
      ],
    );
  }

  factory WeeklyTimetableWeekdayListModel.fromMap(Map map) {
    List<Map<String, dynamic>> list =
        (map['items'] != null && map['items'] is List<Map<String, dynamic>>)
            ? map['items']
            : [];
    final List<WeeklyTimetableDayModel> items =
        List<WeeklyTimetableDayModel>.from(
      list.map(
        (item) => WeeklyTimetableDayModel.fromMap(item),
      ),
    );
    return WeeklyTimetableWeekdayListModel(items: items);
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
    };
  }
}
