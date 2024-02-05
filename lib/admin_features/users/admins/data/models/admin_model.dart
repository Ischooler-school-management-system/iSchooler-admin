import '../../../../../common/educonnect_model.dart';
import '../../../user_model.dart';

class AdminModel extends EduconnectModel {
  final UserModel userModel;

  const AdminModel({
    required super.id,
    required super.name,
    required this.userModel,
    required super.createdAt,
  });

  factory AdminModel.empty() {
    return AdminModel(
      id: '-1',
      name: 'name',
      userModel: UserModel.empty(),
      createdAt: DateTime.now(),
    );
  }

  factory AdminModel.fromUserModel(UserModel userModel) {
    return AdminModel(
      id: userModel.id,
      name: userModel.name,
      userModel: userModel.copyWith(role: UserRole.admin),
      createdAt: DateTime.now(),
    );
  }

  factory AdminModel.dummy() {
    return AdminModel.fromUserModel(
      UserModel.dummy().copyWith(role: UserRole.admin),
    );
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    final userModel =
        UserModel.fromMap(map['school_user']).copyWith(role: UserRole.admin);
    return AdminModel(
      id: userModel.id,
      name: userModel.name,
      userModel: userModel,
      createdAt: DateTime.now(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return userModel.toMap();
  }

  @override
  AdminModel copyWith({
    String? id,
    String? name,
    UserModel? userModel,
    // DateTime? createdAt,
  }) {
    return AdminModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userModel: userModel ?? this.userModel,
      createdAt: createdAt,
    );
  }
}
