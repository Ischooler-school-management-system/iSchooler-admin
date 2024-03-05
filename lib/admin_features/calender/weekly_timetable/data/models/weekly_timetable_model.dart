// ignore_for_file: use_super_parameters, overridden_fields

import '../../../../../common/ischooler_model.dart';
import '../../../../classes/data/models/class_model.dart';

class WeeklyTimetableModel extends IschoolerModel {
  final String term;
  final String classId;
  final DateTime startTime;
  final DateTime endTime;
  final int sessionInterval;
  final int breakInterval;
  final ClassModel classModel;

  const WeeklyTimetableModel({
    required super.id,
    required super.name,
    required this.term,
    required this.classId,
    required this.startTime,
    required this.endTime,
    required this.sessionInterval,
    required this.breakInterval,
    required this.classModel,
  });

  /* 
  
  //  required super.id,
    // required super.name,
    // required this.term,
    // required this.classId,
    required this.startTime,
    required this.endTime,
    required this.sessionInterval,
    required this.breakInterval,
    // required this.classInfo,
   */
  factory WeeklyTimetableModel.empty() {
    return WeeklyTimetableModel(
      id: '-1',
      name: '',
      term: '',
      classId: "-1",
      startTime: DateTime(500, 1, 1, 1, 1),
      endTime: DateTime(500, 1, 1, 1, 1),
      sessionInterval: 0,
      breakInterval: 0,
      classModel: ClassModel.empty(),
    );
  }

  factory WeeklyTimetableModel.dummy() {
    return WeeklyTimetableModel(
      id: '3',
      name: 'Sample Timetable',
      term: 'Spring 2024',
      classId: '1',
      startTime: DateTime(500, 1, 1, 8, 0),
      endTime: DateTime(500, 1, 1, 2, 0),
      sessionInterval: 60,
      breakInterval: 10,
      classModel: ClassModel.dummy(),
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
        classModel,
      ];

  factory WeeklyTimetableModel.fromMap(Map<String, dynamic> map) {
    IschoolerModel ischoolerModel = IschoolerModel.fromMap(map);
    return WeeklyTimetableModel(
      id: ischoolerModel.id,
      name: ischoolerModel.name,
      term: map['term'] ?? '',
      classId: map['class_id'] == null ? '-1' : map['class_id'].toString(),
      startTime: map['start_time'] != null
          ? DateTime.parse(map['start_time'])
          : DateTime(500, 1, 1, 1, 1),
      endTime: map['start_time'] != null
          ? DateTime.parse(map['end_time'])
          : DateTime(500, 1, 1, 1, 1),
      sessionInterval: map['session_interval'] ?? -1,
      breakInterval: map['break_interval'] ?? -1,
      classModel: ClassModel.fromMap(map['class'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'term': term,
      'class_id': classId,
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
      'session_interval': sessionInterval,
      'break_interval': breakInterval,
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
      'Class Info': classModel.toDisplayMap(),
    };
  }

  @override
  WeeklyTimetableModel copyWith({
    int? id,
    String? name,
    String? term,
    String? classId,
    DateTime? startTime,
    DateTime? endTime,
    int? sessionInterval,
    int? breakInterval,
    ClassModel? classModel,
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
      classModel: classModel ?? this.classModel,
    );
  }
}
