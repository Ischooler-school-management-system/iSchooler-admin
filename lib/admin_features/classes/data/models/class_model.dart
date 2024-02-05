import '../../../../common/educonnect_model.dart';
import '../../../grades/data/models/grade_model.dart';

class ClassModel extends EduconnectModel {
  // final String name;
  final GradeModel grade; // Injecting GradeModel object

  const ClassModel({
    required super.id,
    required super.name,
    required this.grade,
  });

  @override
  List<Object?> get props => [id, name, grade];

  factory ClassModel.empty() {
    return ClassModel(id: '-1', name: '', grade: GradeModel.empty());
  }

  factory ClassModel.dummy() {
    return ClassModel(
      id: '1',
      name: 'Class 1',
      grade: GradeModel.dummy(),
    );
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      grade: GradeModel.fromMap(map['grade'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
  ClassModel copyWith(
      {String? id, String? classId, String? name, GradeModel? grade}) {
    return ClassModel(
      id: id ?? this.id,
      name: name ?? this.name,
      grade: grade ?? this.grade,
    );
  }
}
