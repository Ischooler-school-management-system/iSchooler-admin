// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ischooler_admin/admin_features/models.dart';

import '../../../../common/ischooler_model.dart';

class InstructorAssignmentModel extends IschoolerModel {
  final InstructorModel? instructor;
  final ClassModel? classModel;
  final SubjectModel? subjectModel;
  // final DateTime createdAt;

  const InstructorAssignmentModel({
    required super.id,
    required super.name,
    required this.instructor,
    required this.classModel,
    required this.subjectModel,
    // required this.createdAt,
  });

  factory InstructorAssignmentModel.empty() {
    return InstructorAssignmentModel(
      id: '',
      name: '',
      instructor: InstructorModel.empty(),
      classModel: ClassModel.empty(),
      subjectModel: SubjectModel.empty(),
      // createdAt: DateTime.parse(map['created_at']),
    );
  }
  factory InstructorAssignmentModel.dummy() {
    return InstructorAssignmentModel(
      id: '-1',
      name: 'name',
      instructor: InstructorModel.dummy(),
      classModel: ClassModel.dummy(),
      subjectModel: SubjectModel.dummy(),
      // createdAt: DateTime.parse(map['created_at']),
    );
  }

  factory InstructorAssignmentModel.fromMap(Map<String, dynamic> map) {
    IschoolerModel educonnectModel = IschoolerModel.fromMap(map);
    return InstructorAssignmentModel(
      id: educonnectModel.id,
      name: educonnectModel.name,
      instructor: map['instructor'] == null
          ? null
          : InstructorModel.fromMap(map['instructor']),
      classModel:
          map['class'] == null ? null : ClassModel.fromMap(map['class']),
      subjectModel:
          map['subject'] == null ? null : SubjectModel.fromMap(map['subject']),
      // createdAt: DateTime.parse(map['created_at']),
    );
  }
  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Name': name,
      'Class': classModel == null ? '' : classModel!.name,
      'instrucor': instructor == null ? '' : instructor!.name,
      'subject': subjectModel == null ? '' : subjectModel!.name,
    };
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      if (instructor != null) "instructor_id": instructor!.id,
      if (subjectModel != null) "subject_id": subjectModel!.id,
      if (classModel != null) "class_id": classModel!.id,
    };
  }

  @override
  InstructorAssignmentModel copyWith({
    String? name,
    String? grade,
    InstructorModel? instructor,
    ClassModel? classModel,
    SubjectModel? subjectModel,
  }) {
    return InstructorAssignmentModel(
      id: id,
      name: name ?? this.name,
      instructor: instructor ?? this.instructor,
      classModel: classModel ?? this.classModel,
      subjectModel: subjectModel ?? this.subjectModel,
    );
  }

  @override
  String toString() =>
      'InstructorAssignmentModel(instructor: $instructor, classModel: $classModel, subjectModel: $subjectModel)';
}
