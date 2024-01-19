// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../common/educonnect_model.dart';
import 'user_model.dart';

class AllUsersModel extends EduconnectAllModel {
  const AllUsersModel({required super.items});
  factory AllUsersModel.empty() {
    return const AllUsersModel(items: []);
  }
  factory AllUsersModel.fromMap(Map map) {
    final List<UserModel> items = List<UserModel>.from(
      map['items'].map(
        (item) => UserModel.fromMap(item),
      ),
    );
    return AllUsersModel(items: items);
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
  EduconnectAllModel copyWith({
    List<EduconnectModel>? items,
  }) {
    return EduconnectAllModel(
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [items];
}
