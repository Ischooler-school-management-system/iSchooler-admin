// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../common/educonnect_model.dart';
import 'user_model.dart';

class UsersListModel extends EduconnectModelList {
  const UsersListModel({required super.items});
  factory UsersListModel.empty() {
    return const UsersListModel(items: []);
  }
  factory UsersListModel.fromMap(Map map) {
    final List<UserModel> items = List<UserModel>.from(
      map['items'].map(
        (item) => UserModel.fromMap(item),
      ),
    );
    return UsersListModel(items: items);
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  @override
  List<Map<String, dynamic>> toDisplayList() {
    return items.map((item) => item.toDisplayMap()).toList();
  }

  @override
  EduconnectModelList copyWith({
    List<EduconnectModel>? items,
  }) {
    return EduconnectModelList(
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [items];
}
