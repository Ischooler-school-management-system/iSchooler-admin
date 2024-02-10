import '../../../user_model.dart';
import 'admin_role.dart';

class AdminModel extends UserModel {
  final String specialization;
  final DateTime hireDate;
  final AdminRole adminRole;

  const AdminModel({
    required super.id,
    required super.name,
    required super.phoneNumber,
    required super.address,
    required super.gender,
    required super.email,
    required super.role,
    required super.profilePicture,
    required this.specialization,
    required this.hireDate,
    required super.dateOfBirth,
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
      adminRole: AdminRole.empty(),
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
      adminRole: AdminRole.dummy(),
    );
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      role: UserRole.admin,
      profilePicture: map['profile_picture'] ?? '',
      specialization: map['specialization'] ?? '',
      hireDate: DateTime.parse(map['hire_date'] ?? ''),
      dateOfBirth: DateTime.parse(map['date_of_birth'] ?? ''),
      adminRole: AdminRole.fromMap(map['admin_role'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      'specialization': specialization,
      'hire_date': hireDate.toIso8601String(),
      'admin_role': adminRole.toMap(),
    });
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
    AdminRole? adminRole,
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
