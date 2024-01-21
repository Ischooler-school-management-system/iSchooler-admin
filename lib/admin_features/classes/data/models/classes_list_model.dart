import '../../../../common/educonnect_model.dart';
import 'classes_model.dart';

class ClassesListModel extends EduconnectModelList {
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
    final List<ClassModel> items = List<ClassModel>.from(
      map['items'].map(
        (item) => ClassModel.fromMap(item),
      ),
    );
    return ClassesListModel(items: items);
  }
}
