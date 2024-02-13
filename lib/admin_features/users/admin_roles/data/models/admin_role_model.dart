import 'package:school_admin/common/educonnect_model.dart';

class AdminRoleModel extends EduconnectModel {
  const AdminRoleModel({
    required super.id,
    required super.name,
  });

  factory AdminRoleModel.empty() {
    EduconnectModel.empty();
    return AdminRoleModel(
      id: EduconnectModel.empty().id,
      name: EduconnectModel.empty().name,
    );
  }

  factory AdminRoleModel.dummy() {
    return AdminRoleModel(
      id: EduconnectModel.empty().id,
      name: EduconnectModel.empty().name,
    );
  }

  factory AdminRoleModel.fromMap(Map<String, dynamic> map) {
    EduconnectModel educonnectModel = EduconnectModel.fromMap(map);
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
