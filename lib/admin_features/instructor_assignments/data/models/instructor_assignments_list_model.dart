import 'package:collection/collection.dart';
import 'package:ischooler_admin/common/educonnect_model.dart';

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

  factory InstructorAssignmentsListModel.fromJson(List<dynamic> json) {
    List<InstructorAssignmentModel> items =
        json.map((item) => InstructorAssignmentModel.fromMap(item)).toList();
    return InstructorAssignmentsListModel(items: items);
  }
}
