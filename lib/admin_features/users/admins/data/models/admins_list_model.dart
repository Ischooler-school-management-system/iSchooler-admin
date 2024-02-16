// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';

import '../../../../../common/educonnect_model.dart';
import 'admin_model.dart';

class AdminsListModel extends EduconnectListModel {
  @override
  const AdminsListModel({required super.items});
  factory AdminsListModel.empty() {
    return const AdminsListModel(items: []);
  }

  factory AdminsListModel.dummy() {
    return AdminsListModel(
        items: List.generate(3, (index) => AdminModel.dummy()));
  }

  factory AdminsListModel.fromMap(Map map) {
    final List<AdminModel> items = List<AdminModel>.from(
      map['items'].map(
        (item) => AdminModel.fromMap(item),
      ),
    );
    return AdminsListModel(items: items);
  }
  @override
  AdminModel? getModelByName(String modelName) {
    AdminModel? firstWhereOrNull = (items as List<AdminModel>)
        .firstWhereOrNull((AdminModel item) => item.name == modelName);
    return firstWhereOrNull;
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
  @override
  AdminsListModel copyWith({
    List<EduconnectModel>? items,
  }) {
    return AdminsListModel(
      items: items ?? this.items,
    );
  }
}
