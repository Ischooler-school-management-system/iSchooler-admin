import 'package:collection/collection.dart';

import '../../../../../common/ischooler_model.dart';
import 'admin_role_model.dart';

class AdminRolesListModel extends IschoolerListModel {
  const AdminRolesListModel({required List<AdminRoleModel> items})
      : super(items: items);

  factory AdminRolesListModel.empty() {
    return const AdminRolesListModel(items: []);
  }
  factory AdminRolesListModel.dummy() {
    return AdminRolesListModel(items: [
      AdminRoleModel.dummy(),
      AdminRoleModel.dummy(),
      AdminRoleModel.dummy(),
      AdminRoleModel.dummy(),
    ]);
  }
// Function to get a model by name
  @override
  AdminRoleModel? getModelByName(String modelName) {
    AdminRoleModel? firstWhereOrNull = (items as List<AdminRoleModel>)
        .firstWhereOrNull((AdminRoleModel item) => item.name == modelName);
    return firstWhereOrNull;
  }

  factory AdminRolesListModel.fromMap(Map map) {
    List<Map<String, dynamic>> list =
        (map['items'] != null && map['items'] is List<Map<String, dynamic>>)
            ? map['items']
            : [];
    final List<AdminRoleModel> items = List<AdminRoleModel>.from(
      list.map(
        (item) => AdminRoleModel.fromMap(item),
      ),
    );
    return AdminRolesListModel(items: items);
    // return AdminRolesListModel.dummy();
  }
}
