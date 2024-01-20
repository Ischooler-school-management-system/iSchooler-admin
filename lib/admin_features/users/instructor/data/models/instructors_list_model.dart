import '../../../../../common/educonnect_model.dart';
import '../../../users_list_model.dart';
import 'instructor_model.dart';

class InstructorsListModel extends UsersListModel {
  const InstructorsListModel({required super.items});

  factory InstructorsListModel.empty() {
    return const InstructorsListModel(items: []);
  }
  @override
  InstructorsListModel copyWith({
    List<EduconnectModel>? items,
  }) {
    return InstructorsListModel(
      items: items ?? this.items,
    );
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
