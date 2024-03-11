import 'package:flutter/material.dart'; // Import TimeOfDay
import '../../../../../common/functions/ischooler_date_time_helper.dart';
import '../../../../models.dart';
import '../../../../../common/ischooler_model.dart';
import '../../../weekly_timetable_day/data/models/weekly_timetable_day_model.dart';

class WeeklySessionModel extends IschoolerModel {
  final int sessionNumber;
  final WeeklyTimetableDayModel weeklyTimetableDay;
  final InstructorAssignmentModel instructorAssignment;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const WeeklySessionModel({
    required super.id,
    required super.name,
    required this.sessionNumber,
    required this.weeklyTimetableDay,
    required this.instructorAssignment,
    this.startTime = const TimeOfDay(hour: 1, minute: 1),
    this.endTime = const TimeOfDay(hour: 1, minute: 1),
  });

  factory WeeklySessionModel.fromMap(Map<String, dynamic> map) {
    IschoolerModel ischoolerModel = IschoolerModel.fromMap(map);
    return WeeklySessionModel(
      id: ischoolerModel.id,
      name: ischoolerModel.name,
      sessionNumber: map['session_number'],
      instructorAssignment:
          InstructorAssignmentModel.fromMap(map['instructor_assignment']),
      weeklyTimetableDay:
          WeeklyTimetableDayModel.fromMap(map['weekly_timetable_day']),
      startTime: IschoolerDateAndTimeHelper.toTimeOfDay(map['starting_time']),
      endTime: IschoolerDateAndTimeHelper.toTimeOfDay(map['ending_time']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'session_number': sessionNumber,
      'weekly_timetable_day_id': weeklyTimetableDay.id,
      'instructor_assignment_id': instructorAssignment.id,
      'starting_time': IschoolerDateAndTimeHelper.timeOfDayToMap(startTime),
      'ending_time': IschoolerDateAndTimeHelper.timeOfDayToMap(endTime),
    };
  }

  factory WeeklySessionModel.dummy() {
    return WeeklySessionModel(
      id: '',
      name: '',
      sessionNumber: -1,
      weeklyTimetableDay: WeeklyTimetableDayModel.dummy(),
      instructorAssignment: InstructorAssignmentModel.dummy(),
      startTime: const TimeOfDay(hour: 0, minute: 0),
      endTime: const TimeOfDay(hour: 0, minute: 0),
    );
  }

  factory WeeklySessionModel.empty() {
    return WeeklySessionModel(
      id: '-1',
      name: '',
      sessionNumber: -1,
      weeklyTimetableDay: WeeklyTimetableDayModel.empty(),
      instructorAssignment: InstructorAssignmentModel.empty(),
      startTime: const TimeOfDay(hour: 0, minute: 0),
      endTime: const TimeOfDay(hour: 0, minute: 0),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        sessionNumber,
        instructorAssignment,
      ];

  @override
  String toString() {
    return 'WeeklySessionModel(${super.toString()},sessionNumber: $sessionNumber, instructorAssignment: $instructorAssignment)';
  }

  @override
  WeeklySessionModel copyWith({
    String? name,
    int? sessionNumber,
    InstructorAssignmentModel? instructorAssignment,
    WeeklyTimetableDayModel? weeklyTimetableDay,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return WeeklySessionModel(
      id: id,
      name: name ?? this.name,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      instructorAssignment: instructorAssignment ?? this.instructorAssignment,
      weeklyTimetableDay: weeklyTimetableDay ?? this.weeklyTimetableDay,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
