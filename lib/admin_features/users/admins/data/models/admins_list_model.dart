// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../common/educonnect_model.dart';
import '../../../users_list_model.dart';
import 'admin_model.dart';

class AllAdminsModel extends UsersListModel {
  @override
  const AllAdminsModel({required super.items});
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
  @override
  EduconnectModelList copyWith({
    List<EduconnectModel>? items,
  }) {
    return EduconnectModelList(
      items: items ?? this.items,
    );
  }
}
