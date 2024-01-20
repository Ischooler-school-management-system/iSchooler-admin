import '../../../users_list_model.dart';
import 'instructor_model.dart';

class InstructorsListModel extends UsersListModel {
  const InstructorsListModel({required List<InstructorModel> items})
      : super(items: items);

  factory InstructorsListModel.empty() {
    return const InstructorsListModel(items: []);
  }

  factory InstructorsListModel.fromMap(Map map) {
    final List<InstructorModel> items = List<InstructorModel>.from(
      map['items'].map(
        (item) => InstructorModel.fromMap(item),
      ),
    );
    return InstructorsListModel(items: items);
  }
}
