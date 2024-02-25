// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically
import 'package:equatable/equatable.dart';
import 'package:ischooler_admin/admin_features/list_models.dart';
import 'package:ischooler_admin/admin_features/models.dart';
import 'package:ischooler_admin/common/madpoly.dart';

import '../admin_features/calender/weekly_session/data/models/weekly_session_model.dart';
import '../admin_features/calender/weekly_session/data/models/weekly_sessions_list_model.dart';
import '../admin_features/calender/weekly_timetable/data/models/weekly_timetable_model.dart';

class IschoolerModel extends Equatable {
  final String id;
  final String name;
  // final DateTime createdAt;

  const IschoolerModel({
    required this.id,
    this.name = '',
    // required this.createdAt,
  });

  factory IschoolerModel.empty() {
    return const IschoolerModel(
      id: '-1',
      name: 'name',
      // createdAt: DateTime(5000),
    );
  }

  factory IschoolerModel.dummy() {
    return const IschoolerModel(
      id: '-1',
      name: 'name',
      // createdAt: DateTime.now(),
    );
  }

  factory IschoolerModel.fromMap(Map<String, dynamic> map) {
    return IschoolerModel(
      id: map['id'] != null ? map['id'].toString() : '-1',
      name: map['name'] ?? '',
      // createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'name': name,
      // 'created_at': createdAt.toIso8601String(),
    };
  }

  Map<String, dynamic> idToMap() {
    return {'id': id};
  }

  Map<String, dynamic> toMapFromChild() {
    Madpoly.print(
      'model = $runtimeType',
      inspectObject: this,
      tag: 'IschoolerModel > toMapFromChild',
      developer: "Ziad",
    );
    if (this is StudentModel) {
      return (this as StudentModel).toMap();
    } else if (this is AdminModel) {
      return (this as AdminModel).toMap();
    } else if (this is AdminRoleModel) {
      return (this as AdminRoleModel).toMap();
    } else if (this is InstructorModel) {
      return (this as InstructorModel).toMap();
    } else if (this is InstructorAssignmentModel) {
      return (this as InstructorAssignmentModel).toMap();
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
  /*  UserModel? getUserModel() {
    UserModel? userModel;
    if (this is StudentModel) {
      userModel = (this as StudentModel).userModel;
      // return (this as StudentModel).toMap();
    } else if (this is AdminModel) {
      userModel = (this as AdminModel).userModel;

      // return (this as AdminModel).toMap();
    } else if (this is InstructorModel) {
      userModel = (this as InstructorModel).userModel;

      // return (this as InstructorModel).toMap();
    }
    return userModel;
  }
 */
  IschoolerModel copyWith({String? name}) {
    return IschoolerModel(
      id: id,
      name: name ?? this.name,
      // // createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        // createdAt,
      ];

  @override
  String toString() => 'id: $id, name: $name';
}

class IschoolerListModel extends Equatable {
  final List<IschoolerModel> items;

  const IschoolerListModel({required this.items});
  factory IschoolerListModel.empty() {
    return const IschoolerListModel(items: []);
  }

  factory IschoolerListModel.fromMap(Map map) {
    final List<IschoolerModel> items = List<IschoolerModel>.from(
      map['items'] ??
          [].map(
            (item) => IschoolerModel.fromMap(item),
          ),
    );
    return IschoolerListModel(items: items);
  }
  IschoolerListModel fromMapToChild(Map<String, dynamic> map) {
    Madpoly.print(
      'model = $this',
      tag: 'IschoolerModelList > fromMapToChild',
      developer: "Ziad",
    );

    if (this is StudentsListModel) {
      return StudentsListModel.fromMap(map);
    } else if (this is AdminsListModel) {
      return AdminsListModel.fromMap(map);
    } else if (this is AdminRolesListModel) {
      return AdminRolesListModel.fromMap(map);
    } else if (this is InstructorsListModel) {
      return InstructorsListModel.fromMap(map);
    } else if (this is InstructorAssignmentsListModel) {
      return InstructorAssignmentsListModel.fromMap(map);
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

    return IschoolerListModel.fromMap(map);
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

  IschoolerModel? getModelByName(String modelName) {
    // every model must have a unique function because if it doesn't
    // it goes into infinite loop because this function here is the defaults for all
    // like a recursive function without base case
    Madpoly.print(
      'model = $this',
      tag: 'IschoolerModelList > getModelByName',
      developer: "Ziad",
    );

    if (this is StudentsListModel) {
      return (this as StudentsListModel).getModelByName(modelName);
    } else if (this is AdminsListModel) {
      return (this as AdminsListModel).getModelByName(modelName);
    } else if (this is AdminRolesListModel) {
      return (this as AdminRolesListModel).getModelByName(modelName);
    } else if (this is InstructorsListModel) {
      return (this as InstructorsListModel).getModelByName(modelName);
    } else if (this is InstructorAssignmentsListModel) {
      return (this as InstructorAssignmentsListModel).getModelByName(modelName);
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
      (IschoolerModel item) => item.name == modelName,
    );
  }

  @override
  List<Object> get props => [items];

  IschoolerListModel copyWith({
    List<IschoolerModel>? items,
  }) {
    return IschoolerListModel(
      items: items ?? this.items,
    );
  }
}
