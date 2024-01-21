import '../../../../common/educonnect_model.dart';

class GradeModel extends EduconnectModel {
  // final String gradeId;
  // final String name;

  const GradeModel({
    required super.id,
    required super.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory GradeModel.empty() {
    return const GradeModel(id: '-1', name: '');
  }
  factory GradeModel.dummy() {
    return const GradeModel(
      id: '1',
      name: 'Excellent',
    );
  }
  factory GradeModel.fromMap(Map<String, dynamic> map) {
    return GradeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Name': name,
    };
  }

  @override
  GradeModel copyWith({String? id, String? grade, String? name}) {
    return GradeModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
