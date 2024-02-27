// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_super_parameters, overridden_fields

import 'package:ischooler_admin/admin_features/models.dart';
import 'package:ischooler_admin/common/ischooler_model.dart';

import '../../../weekly_timetable_day/data/models/weekly_timetable_day_model.dart';

class WeeklySessionModel extends IschoolerModel {
  final int sessionNumber;
  final WeeklyTimetableDayModel weeklyTimetableDay;
  final InstructorAssignmentModel instructorAssignment;
  final String startTime;
  final String endTime;

  const WeeklySessionModel({
    required super.id,
    required super.name,
    required this.sessionNumber,
    // required this.weeklyTimetableDayId,
    // required this.instructorAssignmentId,
    required this.weeklyTimetableDay,
    required this.instructorAssignment,
    this.startTime = '',
    this.endTime = '',
  });

  factory WeeklySessionModel.fromMap(Map<String, dynamic> map) {
    IschoolerModel educonnectModel = IschoolerModel.fromMap(map);
    return WeeklySessionModel(
      id: educonnectModel.id,
      name: educonnectModel.name,
      sessionNumber: map['session_number'],
      // weeklyTimetableDayId: map['weekly_timetable_day_id'].toString(),
      // instructorAssignmentId: map['instructor_assignment_id'].toString(),
      // weeklyTimetableDay: WeeklyTimetableDayModel.fromMap(map['weekly_timetable_day']),
      instructorAssignment:
          InstructorAssignmentModel.fromMap(map['instructor_assignment']),
      weeklyTimetableDay:
          WeeklyTimetableDayModel.fromMap(map['weekly_timetable_day']),
    );
  }
  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'session_number': sessionNumber,
      'weekly_timetable_day_id': weeklyTimetableDay.id,
      'instructor_assignment_id': instructorAssignment.id,
      // 'instructor_assignment': instructorAssignment.toMap(),
      // 'start_time': startTime,
      // 'end_time': endTime,
    };
  }

  factory WeeklySessionModel.dummy() {
    return WeeklySessionModel(
      id: '',
      name: '',
      sessionNumber: -1,
      // weeklyTimetableDayId: '-1',
      // instructorAssignmentId: '-1',
      weeklyTimetableDay: WeeklyTimetableDayModel.dummy(),

      // weeklyTimetableDay: WeeklyTimetableDayModel.fromMap(map['weekly_timetable_day']),
      instructorAssignment: InstructorAssignmentModel.dummy(),
    );
  }
  factory WeeklySessionModel.empty() {
    return WeeklySessionModel(
      id: '-1',
      name: '',
      sessionNumber: -1,
      // weeklyTimetableDayId: '-1',
      // instructorAssignmentId: '-1',
      weeklyTimetableDay: WeeklyTimetableDayModel.empty(),

      // weeklyTimetableDay: WeeklyTimetableDayModel.fromMap(map['weekly_timetable_day']),
      instructorAssignment: InstructorAssignmentModel.empty(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        sessionNumber,
        // weeklyTimetableDayId,
        // instructorAssignmentId,
        // weeklyTimetableDay,
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
    // String? weeklyTimetableDayId,
    // String? instructorAssignmentId,
    InstructorAssignmentModel? instructorAssignment,
    WeeklyTimetableDayModel? weeklyTimetableDay,
    String? startTime,
    String? endTime,
  }) {
    return WeeklySessionModel(
      id: id,
      name: name ?? this.name,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      // instructorAssignmentId:
      // // instructorAssignmentId ?? this.instructorAssignmentId,
      instructorAssignment: instructorAssignment ?? this.instructorAssignment,
      weeklyTimetableDay: weeklyTimetableDay ?? this.weeklyTimetableDay,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
