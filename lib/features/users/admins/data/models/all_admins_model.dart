// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'admin_model.dart';

class AllAdminsModel extends Equatable {
  final List<AdminModel> items;

  const AllAdminsModel({required this.items});
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
  List<Object> get props => [items];
}
