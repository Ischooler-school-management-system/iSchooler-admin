import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically

import '../../../../common/educonnect_model.dart';
import 'class_model.dart';

class ClassesListModel extends IschoolerListModel {
  const ClassesListModel({required List<ClassModel> items})
      : super(items: items);

  factory ClassesListModel.empty() {
    return const ClassesListModel(items: []);
  }
  factory ClassesListModel.dummy() {
    return ClassesListModel(items: [
      ClassModel.dummy(),
      ClassModel.dummy(),
      ClassModel.dummy(),
      ClassModel.dummy(),
    ]);
  }
  factory ClassesListModel.fromMap(Map map) {
    List<Map<String, dynamic>> list =
        (map['items'] != null && map['items'] is List<Map<String, dynamic>>)
            ? map['items']
            : [];

    final List<ClassModel> items = List<ClassModel>.from(
      list.map(
        (item) {
          return ClassModel.fromMap(item);
        },
      ),
    );

    return ClassesListModel(items: items);
    // return ClassesListModel.dummy();
  }

  // Function to get a model by name
  @override
  ClassModel? getModelByName(String modelName) {
    ClassModel? firstWhereOrNull = (items as List<ClassModel>)
        .firstWhereOrNull((ClassModel item) => item.name == modelName);
    return firstWhereOrNull;
  }
}
