// ignore_for_file: use_super_parameters, overridden_fields

import '../../common/educonnect_model.dart';
import '../classes/data/models/class_model.dart';

class WeeklyTimetableModel extends EduconnectModel {
  final String term;
  final int classId;
  final int startTime;
  final int endTime;
  final int sessionInterval;
  final int breakInterval;
  final ClassModel classInfo;

  const WeeklyTimetableModel({
    required super.id,
    required super.name,
    required this.term,
    required this.classId,
    required this.startTime,
    required this.endTime,
    required this.sessionInterval,
    required this.breakInterval,
    required this.classInfo,
  });
  factory WeeklyTimetableModel.empty() {
    return WeeklyTimetableModel(
      id: '-1',
      name: '',
      term: '',
      classId: -1,
      startTime: -1,
      endTime: -1,
      sessionInterval: 0,
      breakInterval: 0,
      classInfo: ClassModel.empty(),
    );
  }

  factory WeeklyTimetableModel.dummy() {
    return WeeklyTimetableModel(
      id: '12341',
      name: 'Sample Timetable',
      term: 'Spring 2024',
      classId: 1,
      startTime: 8,
      endTime: 2,
      sessionInterval: 60,
      breakInterval: 10,
      classInfo: ClassModel.dummy(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        term,
        classId,
        startTime,
        endTime,
        sessionInterval,
        breakInterval,
        classInfo,
      ];
/* [
  {
    "id": 1,
    "name": "Sample Timetable",
    "term": "Spring 2024",
    "class_id": 1,
    "start_time": 8,
    "end_time": 14,
    "session_interval": 60,
    "break_interval": 10,
    "class": {
      "id": 1,
      "name": "Class A",
      "grade_id": 1,
      "created_at": "2024-02-09T14:51:24.81227"
    }
  }
]
 */
  factory WeeklyTimetableModel.fromMap(Map<String, dynamic> map) {
    EduconnectModel educonnectModel = EduconnectModel.fromMap(map);
    return WeeklyTimetableModel(
      id: educonnectModel.id,
      name: educonnectModel.name,
      term: map['term'] ?? '',
      classId: map['class_id'] ?? -1,
      startTime: map['start_time'] ?? -1,
      endTime: map['end_time'] ?? -1,
      sessionInterval: map['session_interval'] ?? -1,
      breakInterval: map['break_interval'] ?? -1,
      classInfo: ClassModel.fromMap(map['class'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'term': term,
      'class_id': classId,
      'start_time': startTime,
      'end_time': endTime,
      'session_interval': sessionInterval,
      'break_interval': breakInterval,
      'class': classInfo.toMap(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'ID': id,
      'Name': name,
      'Term': term,
      'Class ID': classId,
      'Start Time': startTime,
      'End Time': endTime,
      'Session Interval': '$sessionInterval minutes',
      'Break Interval': '$breakInterval minutes',
      'Class Info': classInfo.toDisplayMap(),
    };
  }

  @override
  WeeklyTimetableModel copyWith({
    int? id,
    String? name,
    String? term,
    int? classId,
    int? startTime,
    int? endTime,
    int? sessionInterval,
    int? breakInterval,
    ClassModel? classInfo,
  }) {
    return WeeklyTimetableModel(
      id: this.id,
      name: name ?? this.name,
      term: term ?? this.term,
      classId: classId ?? this.classId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      sessionInterval: sessionInterval ?? this.sessionInterval,
      breakInterval: breakInterval ?? this.breakInterval,
      classInfo: classInfo ?? this.classInfo,
    );
  }
}
