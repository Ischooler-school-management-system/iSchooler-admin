// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'user_model.dart';

class AllUsersModel extends Equatable {
  final List<UserModel> items;

  const AllUsersModel({required this.items});
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
  Map<String, dynamic> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  List<Map<String, dynamic>> toDisplayList() {
    return items.map((item) => item.toDisplayMap()).toList();
  }

  @override
  List<Object> get props => [items];
}
