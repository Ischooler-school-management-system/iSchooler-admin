import '../../../../common/educonnect_model.dart';
import '../../../grades/data/models/grade_model.dart';

class ClassModel extends IschoolerModel {
  final GradeModel grade;

  const ClassModel({
    required super.id,
    required super.name,
    required this.grade,
    // required super.createdAt,
  });

  factory ClassModel.empty() {
    return ClassModel(
      id: '-1',
      name: '',
      grade: GradeModel.empty(),
      // createdAt: DateTime.now(),
    );
  }

  factory ClassModel.dummy() {
    return ClassModel(
      id: '1',
      name: 'Class 1',
      grade: GradeModel.dummy(),
      // createdAt: DateTime.now(),
    );
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    IschoolerModel educonnectModel = IschoolerModel.fromMap(map);
    return ClassModel(
      id: educonnectModel.id,
      name: educonnectModel.name,
      grade: GradeModel.fromMap(map['grade'] ?? {}),
      // createdAt: DateTime.now(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'grade_id': grade.id,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Class Name': name,
      'Grade': grade.name,
    };
  }

  @override
  ClassModel copyWith({
    String? name,
    GradeModel? grade,
  }) {
    return ClassModel(
      id: id,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      // // createdAt: createdAt,
    );
  }
}
