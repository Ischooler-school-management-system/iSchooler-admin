import '../../../../../common/functions/ischooler_date_time_helper.dart';
import '../../../user_model.dart';

class InstructorModel extends UserModel {
  final String specialization;
  final DateTime hireDate;

  const InstructorModel({
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
  });

  factory InstructorModel.dummy() {
    return InstructorModel(
      id: '123456',
      name: 'JohnDoe',
      dateOfBirth: DateTime(1990, 5, 15),
      phoneNumber: '555-1234',
      address: '123 Main St, City',
      gender: 'Male',
      email: 'john.doe@example.com',
      role: UserRole.instructor,
      profilePicture: 'path/to/profile_picture.jpg',
      specialization: 'Mathematics',
      hireDate: DateTime(2021, 1, 15),
    );
  }

  factory InstructorModel.empty() {
    return InstructorModel(
      id: '',
      name: '',
      phoneNumber: '',
      address: '',
      gender: '',
      email: '',
      role: UserRole.instructor,
      profilePicture: '',
      specialization: '',
      dateOfBirth: DateTime(1990, 5, 15),
      hireDate: DateTime(2021, 1, 15),
    );
  }
  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    var userModel = UserModel.fromMap(map).copyWith(role: UserRole.instructor);
    return InstructorModel(
      id: userModel.id,
      name: userModel.name,
      phoneNumber: userModel.phoneNumber,
      address: userModel.address,
      gender: userModel.gender,
      email: userModel.email,
      role: UserRole.instructor,
      profilePicture: userModel.profilePicture,
      specialization: map['specialization'] ?? '',
      // hireDate: DateTime.now(),
      hireDate: IschoolerDateTimeHelper.fromMapItem((map['hire_date'] ?? '')),
      dateOfBirth: userModel.dateOfBirth,
    );
  }

  InstructorModel copyFromUser(UserModel userModel) {
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

  @override
  Map<String, dynamic> toMap() {
    var userModelMap = super.toMap();
    userModelMap.addAll({
      'specialization': specialization,
      'hire_date': hireDate.toIso8601String(),
    });
    return userModelMap;
  }

  @override
  InstructorModel copyWith({
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
  }) {
    return InstructorModel(
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
    );
  }

  @override
  String toString() {
    return 'InstructorModel{instructorId: $id, name: $name, phoneNumber: $phoneNumber, address: $address, gender: $gender, email: $email, role: ${role.name}, profilePicture: $profilePicture, specialization: $specialization, hireDate: $hireDate, dateOfBirth: $dateOfBirth}';
  }
}
