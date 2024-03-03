import 'package:collection/collection.dart';
import 'package:ischooler_admin/common/ischooler_model.dart';

import '../../../users/instructor/data/models/instructor_model.dart';
import 'instructor_assignment_model.dart';

class InstructorAssignmentsListModel extends IschoolerListModel {
  const InstructorAssignmentsListModel({required super.items});

  factory InstructorAssignmentsListModel.empty() {
    return const InstructorAssignmentsListModel(items: []);
  }
  factory InstructorAssignmentsListModel.dummy() {
    return InstructorAssignmentsListModel(items: [
      InstructorAssignmentModel.dummy(),
      InstructorAssignmentModel.dummy(),
      InstructorAssignmentModel.dummy(),
      InstructorAssignmentModel.dummy(),
    ]);
  }

  factory InstructorAssignmentsListModel.fromMap(Map map) {
    final List<InstructorAssignmentModel> items =
        List<InstructorAssignmentModel>.from(
      map['items'].map(
        (item) => InstructorAssignmentModel.fromMap(item),
      ),
    );
    return InstructorAssignmentsListModel(items: items);
  }
  @override
  InstructorAssignmentModel? getModelByName(String modelName) {
    InstructorAssignmentModel? firstWhereOrNull =
        (items as List<InstructorAssignmentModel>).firstWhereOrNull(
            (InstructorAssignmentModel item) => item.name == modelName);
    return firstWhereOrNull;
  }

  InstructorAssignmentModel? getModelByNames({
    required InstructorModel? instructor,
    required String className,
    required String subjectName,
  }) {
    InstructorAssignmentModel? firstWhereOrNull =
        (items as List<InstructorAssignmentModel>).firstWhereOrNull(
            (InstructorAssignmentModel item) =>
                item.instructor == instructor &&
                item.classModel!.name == className &&
                item.subjectModel!.name == subjectName);
    return firstWhereOrNull;
  }

  // Function to get a list of items' names
  // ClassModel
// SubjectModel
  List<String> getItemClassName() {
    List<String> resultList = [];
    for (var item in items) {
      if (item is InstructorAssignmentModel && item.classModel != null) {
        resultList.add(item.classModel!.name);
      }
    }
    return resultList;
  }

  List<String> getItemSubjectName() {
    List<String> resultList = [];
    for (var item in items) {
      if (item is InstructorAssignmentModel && item.classModel != null) {
        resultList.add(item.classModel!.name);
      }
    }
    return resultList;
  }

  factory InstructorAssignmentsListModel.fromJson(List<dynamic> json) {
    List<InstructorAssignmentModel> items =
        json.map((item) => InstructorAssignmentModel.fromMap(item)).toList();
    return InstructorAssignmentsListModel(items: items);
  }
}
