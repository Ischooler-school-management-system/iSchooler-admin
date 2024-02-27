// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_super_parameters, overridden_fields

import '../../../../../common/ischooler_model.dart';

class WeeklyTimetableDayModel extends IschoolerModel {
  final String weeklyTimetableId;
  final String weekdayId;

  const WeeklyTimetableDayModel({
    required super.id,
    required this.weeklyTimetableId,
    required this.weekdayId,
  });
  factory WeeklyTimetableDayModel.empty() {
    return const WeeklyTimetableDayModel(
      id: '-1',
      weeklyTimetableId: '-1',
      weekdayId: '-1',
    );
  }

  factory WeeklyTimetableDayModel.dummy() {
    return const WeeklyTimetableDayModel(
      id: '1',
      weeklyTimetableId: '1',
      weekdayId: '3',
    );
  }
  factory WeeklyTimetableDayModel.fromMap(Map<String, dynamic> map) {
    return WeeklyTimetableDayModel(
      id: map['id'] != null ? map['id'].toString() : '-1',
      weeklyTimetableId: map['weekly_timetable_id'] != null
          ? map['weekly_timetable_id'].toString()
          : '-1',
      weekdayId:
          map['weekday_id'] != null ? map['weekday_id'].toString() : '-1',
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
  @override
  List<Object?> get props => [
        id,
        name,
        weeklyTimetableId,
        weekdayId,
        // createdAt,
      ];
}
