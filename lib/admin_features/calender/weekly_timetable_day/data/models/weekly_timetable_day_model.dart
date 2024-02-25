// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_super_parameters, overridden_fields

import '../../../../../common/educonnect_model.dart';

class WeeklyTimetableDayModel extends IschoolerModel {
  final int weeklyTimetableId;
  final int weekdayId;

  const WeeklyTimetableDayModel({
    required super.id,
    required this.weeklyTimetableId,
    required this.weekdayId,
  });
  factory WeeklyTimetableDayModel.empty() {
    return const WeeklyTimetableDayModel(
      id: '-1',
      weeklyTimetableId: -1,
      weekdayId: -1,
    );
  }

  factory WeeklyTimetableDayModel.dummy() {
    return const WeeklyTimetableDayModel(
      id: '1',
      weeklyTimetableId: 1,
      weekdayId: 3,
    );
  }
  factory WeeklyTimetableDayModel.fromMap(Map<String, dynamic> map) {
    return WeeklyTimetableDayModel(
      id: map['id'].toString(),
      weeklyTimetableId: map['weekly_timetable_id'],
      weekdayId: map['weekday_id'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'weekly_timetable_id': weeklyTimetableId,
      'weekday_id': weekdayId,
    };
  }

  @override
  String toString() => 'WeeklyTimetableDayModel(id:$id,'
      'weeklyTimetableId: $weeklyTimetableId, '
      'weekdayId: $weekdayId)';
}

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
