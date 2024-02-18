// ignore_for_file: use_super_parameters, overridden_fields

import 'package:school_admin/admin_features/models.dart';
import 'package:school_admin/common/educonnect_model.dart';

class WeeklySessionModel extends EduconnectModel {
  final int sessionNumber;
  final String weekday;
  final DateTime startTime;
  final DateTime endTime;
  final int sessionInterval;
  final SubjectModel subject;
  final String? instructor; // Optional

  const WeeklySessionModel({
    required super.id,
    required this.sessionNumber,
    required this.weekday,
    required this.startTime,
    required this.endTime,
    required this.sessionInterval,
    required this.subject,
    this.instructor,
    // required super.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        sessionNumber,
        weekday,
        startTime,
        endTime,
        sessionInterval,
        subject,
        instructor
      ];

  factory WeeklySessionModel.empty() {
    return WeeklySessionModel(
      // createdAt: DateTime(5000),
      id: '-1',
      sessionNumber: 0,
      weekday: '',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      sessionInterval: 0,
      subject: SubjectModel.empty(),
      instructor: null,
    );
  }
  factory WeeklySessionModel.dummy() {
    return WeeklySessionModel(
      // createdAt: DateTime(5000),
      id: '1', // You can assign a unique ID for the dummy data
      sessionNumber: 1,
      weekday: 'Monday',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      sessionInterval: 60,
      subject: SubjectModel.dummy(),
      instructor: 'John Doe',
    );
  }
  factory WeeklySessionModel.fromMap(Map<String, dynamic> map) {
    return WeeklySessionModel(
      // createdAt: DateTime.parse(map['created_at']),
      id: map['id'].toString(),
      sessionNumber: map['sessionNumber'] ?? 0,
      weekday: map['weekday'] ?? '',
      startTime: DateTime.parse(map['startTime'] ?? ''),
      endTime: DateTime.parse(map['endTime'] ?? ''),
      sessionInterval: map['sessionInterval'] ?? 0,
      subject: SubjectModel.fromMap(map['subject'] ?? {}),
      instructor: map['instructor'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'session_number': sessionNumber,
      'weekday': weekday,
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
      'session_interval': sessionInterval,
      'subject_id': subject.id,
      'instructor': instructor,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Session Number': sessionNumber,
      'Weekday': weekday,
      'Start Time': startTime.toString(),
      'End Time': endTime.toString(),
      'Session Interval': sessionInterval,
      'Subject': subject.toDisplayMap(),
      'Instructor': instructor ?? 'N/A',
    };
  }

  @override
  WeeklySessionModel copyWith({
    String? id,
    String? name,
    int? sessionNumber,
    String? weekday,
    DateTime? startTime,
    DateTime? endTime,
    int? sessionInterval,
    SubjectModel? subject,
    String? instructor,
  }) {
    return WeeklySessionModel(
      id: id ?? this.id,
      // // createdAt: createdAt,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      weekday: weekday ?? this.weekday,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      sessionInterval: sessionInterval ?? this.sessionInterval,
      subject: subject ?? this.subject,
      instructor: instructor ?? this.instructor,
    );
  }
}
