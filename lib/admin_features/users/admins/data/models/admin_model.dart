import '../../../user_model.dart';

class AdminModel extends UserModel {
  const AdminModel({
    super.id = '-1',
    super.dateOfBirth,
    super.phoneNumber = '',
    super.name = '',
    super.address = '',
    super.gender = '',
    super.email = '',
    // super.displayName = '',
    super.role = UserRole.admin,
    super.profilePicture = '',
  });

  factory AdminModel.empty() {
    return const AdminModel(
      id: '',
      name: '',
      dateOfBirth: null,
      phoneNumber: '',
      address: '',
      gender: '',
      email: '',
      // displayName: '',
      role: UserRole.admin,
    );
  }
  factory AdminModel.dummy() {
    return AdminModel(
      name: 'JohnDoe',
      id: '123456',
      dateOfBirth: DateTime(1990, 5, 15),
      phoneNumber: '555-1234',
      address: '123 Main St, City',
      gender: 'Male',
      email: 'john.doe@example.com',
      // displayName: 'John Doe',
      role: UserRole.admin,
      profilePicture: 'path/to/profile_picture.jpg',
    );
  }
  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      // // displayName: map['displayName'] ?? '',
      role: map['role'] == UserRole.admin.name ? UserRole.admin : UserRole.none,
    );
  }

  @override
  AdminModel copyWith({
    String? id,
    String? name,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? address,
    bool? paymentStatus,
    String? gender,
    String? email,
    // String? displayName,
    UserRole? role,
    String? profilePicture,
  }) {
    return AdminModel(
      id: id ?? this.id,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      // // // displayName: displayName ?? this.displayName,
      role: role ?? this.role,
      profilePicture: this.profilePicture,
    );
  }

  @override
  String toString() {
    return 'AdminModel{adminId: $id, name: $name, dateOfBirth: $dateOfBirth, '
        'phoneNumber: $phoneNumber, address: $address, '
        'gender: $gender, email: $email, role: ${role.name}}';
  }
}
