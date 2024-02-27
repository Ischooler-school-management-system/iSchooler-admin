import '../../../../../common/ischooler_constants.dart';
import '../../../../../common/functions/ischooler_date_time_helper.dart';
import '../../../user_model.dart';
import '../../../admin_roles/data/models/admin_role_model.dart';

class AdminModel extends UserModel {
  final String specialization;
  final DateTime hireDate;
  final AdminRoleModel adminRole;

  const AdminModel({
    required super.id,
    required super.name,
    required super.phoneNumber,
    required super.address,
    required super.gender,
    required super.email,
    required super.role,
    required super.profilePicture,
    required super.dateOfBirth,
    required this.specialization,
    required this.hireDate,
    required this.adminRole,
  });

  factory AdminModel.empty() {
    return AdminModel(
      id: '',
      name: '',
      dateOfBirth: null,
      phoneNumber: '',
      address: '',
      gender: '',
      email: '',
      role: UserRole.admin,
      profilePicture: '',
      specialization: '',
      hireDate: DateTime(2000),
      adminRole: AdminRoleModel.empty(),
    );
  }

  AdminModel copyFromUser(UserModel userModel) {
    return copyWith(
      id: userModel.id,
      name: userModel.name,
      dateOfBirth: userModel.dateOfBirth,
      phoneNumber: userModel.phoneNumber,
      address: userModel.address,
      gender: userModel.gender,
      email: userModel.email,
      role: userModel.role,
      profilePicture: userModel.profilePicture,
    );
  }

  factory AdminModel.dummy() {
    return AdminModel(
      id: '123456',
      name: 'JohnDoe',
      dateOfBirth: DateTime(1990, 5, 15),
      phoneNumber: '555-1234',
      address: '123 Main St, City',
      gender: 'Male',
      email: 'john.doe@example.com',
      role: UserRole.admin,
      profilePicture: 'path/to/profile_picture.jpg',
      specialization: 'IT',
      hireDate: DateTime(2022, 1, 1),
      adminRole: AdminRoleModel.dummy(),
    );
  }
  factory AdminModel.fromMap(Map<String, dynamic> map) {
    var userModel = UserModel.fromMap(map).copyWith(role: UserRole.admin);

    return AdminModel(
      id: userModel.id,
      name: userModel.name,
      dateOfBirth: userModel.dateOfBirth,
      phoneNumber: userModel.phoneNumber,
      address: userModel.address,
      gender: userModel.gender,
      email: userModel.email,
      role: userModel.role,
      profilePicture: userModel.profilePicture,
      hireDate: IschoolerDateTimeHelper.fromMapItem(map['hire_date']),
      adminRole: AdminRoleModel.fromMap(map['admin_role'] ?? {}),
      specialization: map['specialization'] ?? '',
    );
  }
  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      'specialization': specialization,
      'hire_date': hireDate.toIso8601String(),
      'admin_role_id': adminRole.id,
    });
    return map;
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    var map = {
      IschoolerConstants.localization().name: name,
      // IschoolerConstants.localization().id: id,
      IschoolerConstants.localization().gender: gender,
      'Admin Role': adminRole.name,
      IschoolerConstants.localization().email: email,
    };

    // return truncateMap(map);
    return map;
  }

  @override
  AdminModel copyWith({
    String? id,
    String? name,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? address,
    String? gender,
    String? email,
    UserRole? role,
    String? profilePicture,
    String? specialization,
    DateTime? hireDate,
    AdminRoleModel? adminRole,
  }) {
    return AdminModel(
      id: id ?? this.id,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      role: role ?? this.role,
      profilePicture: profilePicture ?? this.profilePicture,
      specialization: specialization ?? this.specialization,
      hireDate: hireDate ?? this.hireDate,
      adminRole: adminRole ?? this.adminRole,
    );
  }

  @override
  String toString() {
    return 'AdminModel{adminId: $id, name: $name, phoneNumber: $phoneNumber, address: $address, gender: $gender, email: $email, role: ${role.name}, profilePicture: $profilePicture, specialization: $specialization, hireDate: $hireDate, dateOfBirth: $dateOfBirth, adminRole: $adminRole}';
  }
}
