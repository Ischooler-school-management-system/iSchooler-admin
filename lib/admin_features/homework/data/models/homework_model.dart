// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_super_parameters, overridden_fields

import 'package:ischooler_admin/common/functions/ischooler_date_time_helper.dart';

import '../../../../common/ischooler_model.dart';
import '../../../models.dart';

class HomeworkModel extends IschoolerModel {
  final InstructorAssignmentModel instructorAssignment;
  // final SubjectModel subject;
  final DateTime date;
  final String content;

  const HomeworkModel({
    required super.id,
    required this.instructorAssignment,
    required this.date,
    required this.content,
  });

  @override
  List<Object?> get props => [
        id,
        instructorAssignment,
        // subject,
        date,
        content,
      ];

  factory HomeworkModel.empty() {
    return HomeworkModel(
      id: '-1',
      instructorAssignment: InstructorAssignmentModel.empty(),
      // subject: SubjectModel.empty(),
      date: DateTime.now(),
      content: '',
    );
  }
  factory HomeworkModel.dummy() {
    return HomeworkModel(
      id: '1', // You can assign a unique ID for the dummy data
      instructorAssignment: InstructorAssignmentModel.dummy(),
      // subject: SubjectModel.dummy(),
      date: DateTime.now().add(const Duration(days: 7)),
      content: 'Sample homework content',
    );
  }
  factory HomeworkModel.fromMap(Map<String, dynamic> map) {
    var homeworkModel = HomeworkModel(
      id: map['id'].toString(),
      instructorAssignment:
          InstructorAssignmentModel.fromMap(map['instructor_assignment'] ?? {}),
      // subject: SubjectModel.fromMap(map['subject'] ?? {}),
      date: DateTime.parse(map['date'] ?? ''),
      content: map['content'] ?? '',
    );
    return homeworkModel;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'instructor_assignment_id': instructorAssignment.id,

      // 'subject_id': subject.id,
      'date': date.toIso8601String(),
      'content': content,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      // 'Class Info': instructorAssignment.toDisplayMap(),
      // 'Subject': subject.toDisplayMap(),
      'Date': IschoolerDateTimeHelper.dateFormat(date),
      'Content': content,
    };
  }

  @override
  HomeworkModel copyWith({
    String? id,
    String? name,
    InstructorAssignmentModel? instructorAssignmentModel,
    // SubjectModel? subject,
    DateTime? date,
    String? content,
  }) {
    return HomeworkModel(
      id: id ?? this.id,
      instructorAssignment: instructorAssignmentModel ?? instructorAssignment,
      // subject: subject ?? this.subject,
      date: date ?? this.date,
      content: content ?? this.content,
    );
  }

  @override
  String toString() =>
      'HomeworkModel(${super.toString()} instructorAssignment: $instructorAssignment, date: $date, content: $content)';
}
