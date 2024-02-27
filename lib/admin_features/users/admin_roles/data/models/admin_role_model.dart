import 'package:ischooler_admin/common/ischooler_model.dart';

class AdminRoleModel extends IschoolerModel {
  const AdminRoleModel({
    required super.id,
    required super.name,
  });

  factory AdminRoleModel.empty() {
    IschoolerModel.empty();
    return AdminRoleModel(
      id: IschoolerModel.empty().id,
      name: IschoolerModel.empty().name,
    );
  }

  factory AdminRoleModel.dummy() {
    return AdminRoleModel(
      id: IschoolerModel.empty().id,
      name: IschoolerModel.empty().name,
    );
  }

  factory AdminRoleModel.fromMap(Map<String, dynamic> map) {
    IschoolerModel educonnectModel = IschoolerModel.fromMap(map);
    return AdminRoleModel(
      id: educonnectModel.id,
      name: educonnectModel.name,
    );
  }

  @override
  AdminRoleModel copyWith({
    String? id,
    String? name,
  }) {
    return AdminRoleModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'AdminRole{id: $id, name: $name}';
  }
}
