// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../all_users_model.dart';
import 'admin_model.dart';

class AllAdminsModel extends AllUsersModel {
  @override
  final List<AdminModel> items;

  const AllAdminsModel({required this.items}) : super(items: items);
  factory AllAdminsModel.empty() {
    return const AllAdminsModel(items: []);
  }
  factory AllAdminsModel.fromMap(Map map) {
    final List<AdminModel> items = List<AdminModel>.from(
      map['items'].map(
        (item) => AdminModel.fromMap(item),
      ),
    );
    return AllAdminsModel(items: items);
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
  List<Object> get props => [items];
}
