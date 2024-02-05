// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically
import 'package:equatable/equatable.dart';
import 'package:school_admin/common/madpoly.dart';

import '../admin_features/classes/data/models/class_model.dart';
import '../admin_features/classes/data/models/classes_list_model.dart';
import '../admin_features/dashboard/data/models/all_models.dart';
import '../admin_features/grades/data/models/grade_model.dart';
import '../admin_features/grades/data/models/grades_list_model.dart';
import '../admin_features/users/admins/data/models/admin_model.dart';
import '../admin_features/users/admins/data/models/admins_list_model.dart';
import '../admin_features/users/instructor/data/models/instructor_model.dart';
import '../admin_features/users/instructor/data/models/instructors_list_model.dart';
import '../admin_features/users/students/data/models/student_model.dart';
import '../admin_features/users/students/data/models/students_list_model.dart';

class EduconnectModel extends Equatable {
  final String id;
  final String name;
  const EduconnectModel({
    required this.id,
    this.name = '',
  });
  factory EduconnectModel.empty() {
    return const EduconnectModel(
      id: '-1',
      name: 'name',
    );
  }
  factory EduconnectModel.dummy() {
    return const EduconnectModel(
      id: '-1',
      name: 'name',
    );
  }
  factory EduconnectModel.fromMap(Map<String, dynamic> map) {
    return EduconnectModel(id: map['id'].toString(), name: map['name']);
  }
  Map<String, dynamic> toMap() => {'id': id, 'name': name};

  Map<String, dynamic> toMapFromChild() {
    Madpoly.print(
      'model = $this',
      tag: 'EduconnectModel > toMapFromChild',
      developer: "Ziad",
    );

    if (this is StudentModel) {
      return (this as StudentModel).toMap();
    } else if (this is AdminModel) {
      return (this as AdminModel).toMap();
    } else if (this is InstructorModel) {
      return (this as InstructorModel).toMap();
    } else if (this is GradeModel) {
      return (this as GradeModel).toMap();
    } else if (this is ClassModel) {
      return (this as ClassModel).toMap();
    } else if (this is SubjectModel) {
      return (this as SubjectModel).toMap();
    } else if (this is WeeklySessionModel) {
      return (this as WeeklySessionModel).toMap();
    } else if (this is WeeklyTimetableModel) {
      return (this as WeeklyTimetableModel).toMap();
    } else if (this is ExamTypeModel) {
      return (this as ExamTypeModel).toMap();
    } else if (this is ExamModel) {
      return (this as ExamModel).toMap();
    } else if (this is ExamSessionModel) {
      return (this as ExamSessionModel).toMap();
    } else if (this is ExamTimetableModel) {
      return (this as ExamTimetableModel).toMap();
    } else if (this is HomeworkModel) {
      return (this as HomeworkModel).toMap();
    } else if (this is NewsModel) {
      return (this as NewsModel).toMap();
    }

    return toMap();
  }

  Map<String, dynamic> toDisplayMap() => {'name': name, 'id': id};
//temp  to avoid errors only
  EduconnectModel copyWith({String? id /* , String? name */}) {
    return EduconnectModel(
      id: id ?? this.id,
      // name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id];
}

class EduconnectModelList extends Equatable {
  final List<EduconnectModel> items;

  const EduconnectModelList({required this.items});
  factory EduconnectModelList.empty() {
    return const EduconnectModelList(items: []);
  }

  factory EduconnectModelList.fromMap(Map map) {
    final List<EduconnectModel> items = List<EduconnectModel>.from(
      map['items'] ??
          [].map(
            (item) => EduconnectModel.fromMap(item),
          ),
    );
    return EduconnectModelList(items: items);
  }
  EduconnectModelList fromMapToChild(Map<String, dynamic> map) {
    Madpoly.print(
      'model = $this',
      tag: 'EduconnectModelList > fromMapToChild',
      developer: "Ziad",
    );

    if (this is StudentsListModel) {
      return StudentsListModel.fromMap(map);
    } else if (this is AdminsListModel) {
      return AdminsListModel.fromMap(map);
    } else if (this is InstructorsListModel) {
      return InstructorsListModel.fromMap(map);
    } else if (this is GradesListModel) {
      return GradesListModel.fromMap(map);
    } else if (this is ClassesListModel) {
      return ClassesListModel.fromMap(map);
    } else if (this is SubjectsListModel) {
      return SubjectsListModel.fromMap(map);
    } else if (this is WeeklySessionsListModel) {
      return WeeklySessionsListModel.fromMap(map);
    } else if (this is WeeklyTimetablesListModel) {
      return WeeklyTimetablesListModel.fromMap(map);
    } else if (this is ExamTypesListModel) {
      return ExamTypesListModel.fromMap(map);
    } else if (this is ExamsListModel) {
      return ExamsListModel.fromMap(map);
    } else if (this is ExamSessionsListModel) {
      return ExamSessionsListModel.fromMap(map);
    } else if (this is ExamTimetablesListModel) {
      return ExamTimetablesListModel.fromMap(map);
    } else if (this is HomeworksListModel) {
      return HomeworksListModel.fromMap(map);
    } else if (this is NewsListModel) {
      return NewsListModel.fromMap(map);
    }

    return EduconnectModelList.fromMap(map);
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  List<Map<String, dynamic>> toDisplayList() {
    return items.map((item) => item.toDisplayMap()).toList();
  }

  // Function to get a list of items' names
  List<String> getItemNames() {
    return items.map((item) => item.name).toList();
  }

  EduconnectModel? getModelByName(String modelName) {
    Madpoly.print(
      'model = $this',
      tag: 'EduconnectModelList > getModelByName',
      developer: "Ziad",
    );

    if (this is StudentsListModel) {
      return (this as StudentsListModel).getModelByName(modelName);
    } else if (this is AdminsListModel) {
      return (this as AdminsListModel).getModelByName(modelName);
    } else if (this is InstructorsListModel) {
      return (this as InstructorsListModel).getModelByName(modelName);
    } else if (this is GradesListModel) {
      return (this as GradesListModel).getModelByName(modelName);
    } else if (this is ClassesListModel) {
      return (this as ClassesListModel).getModelByName(modelName);
    } else if (this is SubjectsListModel) {
      return (this as SubjectsListModel).getModelByName(modelName);
    } else if (this is WeeklySessionsListModel) {
      return (this as WeeklySessionsListModel).getModelByName(modelName);
    } else if (this is WeeklyTimetablesListModel) {
      return (this as WeeklyTimetablesListModel).getModelByName(modelName);
    } else if (this is ExamTypesListModel) {
      return (this as ExamTypesListModel).getModelByName(modelName);
    } else if (this is ExamsListModel) {
      return (this as ExamsListModel).getModelByName(modelName);
    } else if (this is ExamSessionsListModel) {
      return (this as ExamSessionsListModel).getModelByName(modelName);
    } else if (this is ExamTimetablesListModel) {
      return (this as ExamTimetablesListModel).getModelByName(modelName);
    } else if (this is HomeworksListModel) {
      return (this as HomeworksListModel).getModelByName(modelName);
    } else if (this is NewsListModel) {
      return (this as NewsListModel).getModelByName(modelName);
    }
    return items.firstWhereOrNull(
      (EduconnectModel item) => item.name == modelName,
    );
  }

  @override
  List<Object> get props => [items];

  EduconnectModelList copyWith({
    List<EduconnectModel>? items,
  }) {
    return EduconnectModelList(
      items: items ?? this.items,
    );
  }
}
