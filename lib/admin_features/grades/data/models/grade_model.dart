import '../../../../common/ischooler_model.dart';

class GradeModel extends IschoolerModel {
  const GradeModel({
    required super.id,
    required super.name,
    // required super.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        // createdAt,
      ];

  factory GradeModel.empty() {
    return const GradeModel(
      id: '-1',
      name: '',
      // createdAt: DateTime(5000),
    );
  }

  factory GradeModel.dummy() {
    return const GradeModel(
      id: '1',
      name: 'Grade 1',
      // createdAt: DateTime.now(),
    );
  }

  factory GradeModel.fromMap(Map<String, dynamic> map) {
    IschoolerModel ischoolerModel = IschoolerModel.fromMap(map);
    return GradeModel(
      id: ischoolerModel.id,
      name: ischoolerModel.name,
      // createdAt: DateTime.now(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  Map<String, dynamic> toMapWithId() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  GradeModel copyWith({String? grade, String? name}) {
    return GradeModel(
      id: id,
      name: name ?? this.name,
      // // createdAt: createdAt,
    );
  }
}
