import 'package:collection/collection.dart';

import '../../../../common/ischooler_model.dart';
import 'grade_model.dart';

class GradesListModel extends IschoolerListModel {
  const GradesListModel({required List<GradeModel> items})
      : super(items: items);

  factory GradesListModel.empty() {
    return const GradesListModel(items: []);
  }
  factory GradesListModel.dummy() {
    return GradesListModel(items: [
      GradeModel.dummy(),
      GradeModel.dummy(),
      GradeModel.dummy(),
      GradeModel.dummy(),
    ]);
  }
// Function to get a model by name
  @override
  GradeModel? getModelByName(String modelName) {
    GradeModel? firstWhereOrNull = (items as List<GradeModel>)
        .firstWhereOrNull((GradeModel item) => item.name == modelName);
    return firstWhereOrNull;
  }

  factory GradesListModel.fromMap(Map map) {
    List<Map<String, dynamic>> list =
        (map['items'] != null && map['items'] is List<Map<String, dynamic>>)
            ? map['items']
            : [];
    final List<GradeModel> items = List<GradeModel>.from(
      list.map(
        (item) => GradeModel.fromMap(item),
      ),
    );
    return GradesListModel(items: items);
    // return GradesListModel.dummy();
  }
}
