// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../admin_features/dashboard/data/models/all_models.dart';
import '../admin_features/users/admins/data/models/admins_list_model.dart';
import '../admin_features/users/instructor/data/models/instructors_list_model.dart';
import '../admin_features/users/students/data/models/students_list_model.dart';

class EduconnectModel extends Equatable {
  final String id;
  const EduconnectModel({required this.id});
  factory EduconnectModel.empty() {
    return const EduconnectModel(id: '-1');
  }
  factory EduconnectModel.fromMap(Map<String, dynamic> map) {
    return EduconnectModel(id: map['id'] ?? '');
  }
  Map<String, dynamic> toMap() => {};
  Map<String, dynamic> toDisplayMap() => {};

  EduconnectModel copyWith({String? id}) {
    return EduconnectModel(id: id ?? this.id);
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
      map['items'].map(
        (item) => EduconnectModel.fromMap(item),
      ),
    );
    return EduconnectModelList(items: items);
  }

  static EduconnectModelList fromMapToChild(
      EduconnectModelList model, Map map) {
    if (model is AllStudentsModel) {
      return AllStudentsModel.fromMap(map);
    } else if (model is AllAdminsModel) {
      return AllAdminsModel.fromMap(map);
    } else if (model is InstructorsListModel) {
      return InstructorsListModel.fromMap(map);
    } else if (model is GradesListModel) {
      return GradesListModel.fromMap(map);
    } else if (model is ClassesListModel) {
      return ClassesListModel.fromMap(map);
    } else if (model is SubjectsListModel) {
      return SubjectsListModel.fromMap(map);
    } else if (model is WeeklySessionsListModel) {
      return WeeklySessionsListModel.fromMap(map);
    } else if (model is WeeklyTimetablesListModel) {
      return WeeklyTimetablesListModel.fromMap(map);
    } else if (model is ExamTypesListModel) {
      return ExamTypesListModel.fromMap(map);
    } else if (model is ExamsListModel) {
      return ExamsListModel.fromMap(map);
    } else if (model is ExamSessionsListModel) {
      return ExamSessionsListModel.fromMap(map);
    } else if (model is ExamTimetablesListModel) {
      return ExamTimetablesListModel.fromMap(map);
    } else if (model is HomeworksListModel) {
      return HomeworksListModel.fromMap(map);
    } else if (model is NewsListModel) {
      return NewsListModel.fromMap(map);
    }

    return EduconnectModelList.empty();
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  List<Map<String, dynamic>> toDisplayList() {
    return items.map((item) => item.toDisplayMap()).toList();
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
