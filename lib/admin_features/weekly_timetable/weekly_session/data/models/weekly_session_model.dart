// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_super_parameters, overridden_fields

import 'package:school_admin/admin_features/models.dart';
import 'package:school_admin/common/educonnect_model.dart';

class WeeklySessionModel extends EduconnectModel {
  final int sessionNumber;
  final int weeklyTimetableDayId;
  final int instructorAssignmentId;
  // final WeeklyTimetableDayModel weeklyTimetableDay;
  final InstructorAssignmentModel instructorAssignment;
  final String startTime;
  final String endTime;

  const WeeklySessionModel({
    required super.id,
    required super.name,
    required this.sessionNumber,
    required this.weeklyTimetableDayId,
    required this.instructorAssignmentId,
    // required this.weeklyTimetableDay,
    required this.instructorAssignment,
    this.startTime = '',
    this.endTime = '',
  });

  factory WeeklySessionModel.fromMap(Map<String, dynamic> map) {
    EduconnectModel educonnectModel = EduconnectModel.fromMap(map);
    return WeeklySessionModel(
      id: educonnectModel.id,
      name: educonnectModel.name,
      sessionNumber: map['session_number'],
      weeklyTimetableDayId: map['weekly_timetable_day_id'],
      instructorAssignmentId: map['instructor_assignment_id'],
      // weeklyTimetableDay: WeeklyTimetableDayModel.fromMap(map['weekly_timetable_day']),
      instructorAssignment:
          InstructorAssignmentModel.fromMap(map['instructor_assignment']),
    );
  }
  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'session_number': sessionNumber,
      'weekly_timetable_day_id': weeklyTimetableDayId,
      'instructor_assignment_id': instructorAssignmentId,
      // 'instructor_assignment': instructorAssignment.toMap(),
      'start_time': startTime,
      'end_time': endTime,
    };
  }

  factory WeeklySessionModel.dummy() {
    return WeeklySessionModel(
      id: '',
      name: '',
      sessionNumber: -1,
      weeklyTimetableDayId: -1,
      instructorAssignmentId: -1,
      // weeklyTimetableDay: WeeklyTimetableDayModel.fromMap(map['weekly_timetable_day']),
      instructorAssignment: InstructorAssignmentModel.dummy(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        sessionNumber,
        weeklyTimetableDayId,
        instructorAssignmentId,
        // weeklyTimetableDay,
        instructorAssignment,
      ];

  @override
  String toString() {
    return 'WeeklySessionModel(${super.toString()},sessionNumber: $sessionNumber, weeklyTimetableDayId: $weeklyTimetableDayId, instructorAssignmentId: $instructorAssignmentId, instructorAssignment: $instructorAssignment)';
  }

  @override
  WeeklySessionModel copyWith({
    String? name,
    int? sessionNumber,
    int? weeklyTimetableDayId,
    int? instructorAssignmentId,
    InstructorAssignmentModel? instructorAssignment,
    String? startTime,
    String? endTime,
  }) {
    return WeeklySessionModel(
      id: id,
      name: name ?? this.name,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      weeklyTimetableDayId: weeklyTimetableDayId ?? this.weeklyTimetableDayId,
      instructorAssignmentId:
          instructorAssignmentId ?? this.instructorAssignmentId,
      instructorAssignment: instructorAssignment ?? this.instructorAssignment,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
