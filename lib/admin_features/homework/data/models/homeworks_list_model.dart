// ignore_for_file: use_super_parameters, overridden_fields

import 'homework_model.dart';
import '../../../../common/ischooler_model.dart';

class HomeworksListModel extends IschoolerListModel {
  const HomeworksListModel({required List<HomeworkModel> items})
      : super(items: items);

  factory HomeworksListModel.empty() {
    return const HomeworksListModel(items: []);
  }

  factory HomeworksListModel.dummy() {
    return HomeworksListModel(items: [
      HomeworkModel.empty(),
      HomeworkModel.empty(),
      HomeworkModel.empty(),
      // Add more instances as needed
    ]);
  }

  factory HomeworksListModel.fromMap(Map map) {
    final List<HomeworkModel> items = List<HomeworkModel>.from(
      map['items'].map(
        (item) => HomeworkModel.fromMap(item),
      ),
    );
    return HomeworksListModel(items: items);
  }
}
