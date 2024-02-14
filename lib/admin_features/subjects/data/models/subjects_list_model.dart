import '../../../../common/educonnect_model.dart';
import 'subject_model.dart';

class SubjectsListModel extends EduconnectModelList {
  const SubjectsListModel({required List<SubjectModel> items})
      : super(items: items);

  factory SubjectsListModel.empty() {
    return const SubjectsListModel(items: []);
  }
  factory SubjectsListModel.dummy() {
    return SubjectsListModel(items: [
      SubjectModel.dummy(),
      SubjectModel.dummy(),
      SubjectModel.dummy(),
      SubjectModel.dummy(),
    ]);
  }
  factory SubjectsListModel.fromMap(Map map) {
    final List<SubjectModel> items = List<SubjectModel>.from(
      map['items'].map(
        (item) => SubjectModel.fromMap(item),
      ),
    );
    return SubjectsListModel(items: items);
  }
}
