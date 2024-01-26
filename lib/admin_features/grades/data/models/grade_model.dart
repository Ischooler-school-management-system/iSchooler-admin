/* import '../../../../common/educonnect_model.dart';
import '../../../classes/data/models/classes_list_model.dart';

class GradeModel extends EduconnectModel {
  // final String gradeId;
  // final String name;
  final ClassesListModel classes;

  const GradeModel({
    required super.id,
    required super.name,
    required this.classes,
  });

  @override
  List<Object?> get props => [id, name];

  factory GradeModel.empty() {
    return GradeModel(
      id: '-1',
      name: '',
      classes: ClassesListModel.empty(),
    );
  }
  factory GradeModel.dummy() {
    return GradeModel(
      id: '1',
      name: 'Grade 1',
      classes: ClassesListModel.dummy(),
    );
  }
  factory GradeModel.fromMap(Map<String, dynamic> map) {
    return GradeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      classes: ClassesListModel.fromMap(const {}),
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
  GradeModel copyWith({
    String? id,
    String? grade,
    String? name,
    ClassesListModel? classes,
  }) {
    return GradeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      classes: classes ?? this.classes,
    );
  }
}
 */

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
      name: 'Grade 1',
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
      // 'id': id,
      'name': name,
    };
  }

  Map<String, dynamic> toMapWithId() {
    return {
      'id': id,
      'name': name,
    };
  }

  /*  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Name': name,
    };
  } */

  @override
  GradeModel copyWith({String? id, String? grade, String? name}) {
    return GradeModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
