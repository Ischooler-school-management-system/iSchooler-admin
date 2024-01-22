import '../../../user_model.dart';

class InstructorModel extends UserModel {
  const InstructorModel({
    required super.name,
    required super.id,
    required super.dateOfBirth,
    required super.phoneNumber,
    required super.address,
    required super.gender,
    required super.email,
    // required super.displayName,
    super.role = UserRole.instructor,
    required super.profilePicture,
  });

  factory InstructorModel.empty() {
    return const InstructorModel(
      id: '',
      name: '',
      dateOfBirth: null,
      phoneNumber: '',
      address: '',
      gender: '',
      email: '',
      // displayName: '',
      role: UserRole.instructor,
      profilePicture: '',
    );
  }
  factory InstructorModel.dummy() {
    return InstructorModel(
      name: 'JohnDoe',
      id: '123456',
      dateOfBirth: DateTime(1990, 5, 15),
      phoneNumber: '555-1234',
      address: '123 Main St, City',
      gender: 'Male',
      email: 'john.doe@example.com',
      // displayName: 'John Doe',
      role: UserRole.instructor,
      profilePicture: 'path/to/profile_picture.jpg',
    );
  }

  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    return InstructorModel(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      // // displayName: map['displayName'] ?? '',
      role: map['role'] == UserRole.instructor.name
          ? UserRole.instructor
          : UserRole.none,
      profilePicture: map['profilePicture'] ?? '',
    );
  }
  @override
  InstructorModel copyWith({
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
    return InstructorModel(
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
}
