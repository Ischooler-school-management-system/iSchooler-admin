import '../../../user_model.dart';

class InstructorModel extends UserModel {
  const InstructorModel({
    required super.userName,
    required super.id,
    required super.dateOfBirth,
    required super.phoneNumber,
    required super.address,
    required super.gender,
    required super.email,
    required super.displayName,
    super.role = UserRole.instructor,
    required super.profilePicture,
  });

  factory InstructorModel.empty() {
    return const InstructorModel(
      id: '',
      userName: '',
      dateOfBirth: null,
      phoneNumber: '',
      address: '',
      gender: '',
      email: '',
      displayName: '',
      role: UserRole.instructor,
      profilePicture: '',
    );
  }
  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    return InstructorModel(
      userName: map['userName'] ?? '',
      id: map['id'] ?? '',
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      role: map['role'] == UserRole.instructor.name
          ? UserRole.instructor
          : UserRole.none,
      profilePicture: map['profilePicture'] ?? '',
    );
  }
  @override
  InstructorModel copyWith({
    String? id,
    String? userName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? address,
    bool? paymentStatus,
    String? gender,
    String? email,
    String? displayName,
    UserRole? role,
    String? profilePicture,
  }) {
    return InstructorModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      role: role ?? this.role,
      profilePicture: this.profilePicture,
    );
  }
}
