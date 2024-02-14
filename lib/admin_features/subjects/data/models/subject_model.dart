import '../../../../common/educonnect_model.dart';
import '../../../grades/data/models/grade_model.dart';

class SubjectModel extends EduconnectModel {
  final GradeModel grade; // Injecting GradeModel object
  final int totalMarks;

  const SubjectModel({
    required super.id,
    required super.name,
    required this.grade,
    required this.totalMarks,
    // required super.createdAt,
  });

  @override
  List<Object?> get props => [id, name, grade, totalMarks];

  factory SubjectModel.empty() {
    return SubjectModel(
      id: '-1',
      name: '',
      grade: GradeModel.empty(),
      totalMarks: 0,
      // createdAt: DateTime(5000),
    );
  }
  factory SubjectModel.dummy() {
    return SubjectModel(
      id: '1',
      // createdAt: DateTime(5000),
      name: 'Introduction to Computer Science',
      grade: GradeModel.dummy(),
      totalMarks: 100,
    );
  }
  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      grade: GradeModel.fromMap(map['grade'] ?? {}),
      totalMarks: map['total_marks'] ?? 0,
      // createdAt: DateTime.parse(map['created_at']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'grade_id': grade.id,
      'total_marks': totalMarks,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Name': name,
      'Grade': grade.name,
      'Total Marks': totalMarks /* .toString() */,
    };
  }

  @override
  SubjectModel copyWith({
    String? id,
    String? name,
    GradeModel? grade,
    int? totalMarks,
  }) {
    return SubjectModel(
      id: id ?? this.id,
      // // createdAt: createdAt,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      totalMarks: totalMarks ?? this.totalMarks,
    );
  }
}
