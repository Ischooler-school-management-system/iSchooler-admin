import '../../common/educonnect_constants.dart';
import '../../common/educonnect_model.dart';
import '../../common/functions/truncate_dashboard_map.dart';

enum UserRole { admin, instructor, student, none }

class UserModel extends EduconnectModel {
  final DateTime? dateOfBirth;
  final String phoneNumber;
  final String address;
  final String gender;
  final String email;
  final UserRole role;
  final String profilePicture;

  const UserModel({
    required super.id,
    required super.name,
    // required super.createdAt,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.email,
    required this.role,
    required this.profilePicture,
  });

  factory UserModel.empty() {
    return const UserModel(
      id: '',
      name: '',
      // createdAt: DateTime(500),
      dateOfBirth: null,
      phoneNumber: '',
      address: '',
      gender: '',
      email: '',
      role: UserRole.none,
      profilePicture: '',
    );
  }

  factory UserModel.dummy() {
    return UserModel(
      id: '123456',
      name: 'JohnDoe',
      // createdAt: DateTime.now(),
      dateOfBirth: DateTime(1990, 5, 15),
      phoneNumber: '555-1234',
      address: '123 Main St, City',
      gender: 'Male',
      email: 'john.doe@example.com',
      role: UserRole.none,
      profilePicture: 'path/to/profile_picture.jpg',
    );
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    UserRole userRole = UserRole.none;
    switch (map['user_role_id']) {
      case 1:
        userRole = UserRole.admin;
        break;
      case 2:
        userRole = UserRole.instructor;
        break;
      case 3:
        userRole = UserRole.student;
        break;
      default:
        userRole = UserRole.none;
    }
    return UserModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      // createdAt: DateTime.parse(map['created_at']),
      dateOfBirth: DateTime.parse(map['date_of_birth'] ??
          DateTime(5000)), // no 'dateOfBirth' in provided JSON
      phoneNumber: map['phone_number'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      role: userRole,
      profilePicture: map['profile_picture'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      // 'user_id': id,
      'name': name,
      'email': email,
      'gender': gender,
      // 'date_of_birth': dateOfBirth?.toIso8601String(),
      'phone_number': phoneNumber,
      'address': address,
      'profile_picture': profilePicture,
      // 'role': role.toString().split('.').last, // Convert enum to string
      // 'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap({int? limit}) {
    var map = {
      EduconnectConstants.localization().name: name,
      EduconnectConstants.localization().id: id,
      EduconnectConstants.localization().gender: gender,
      EduconnectConstants.localization().email: email,
    };

    return truncateMap(map);
  }

  @override
  UserModel copyWith({
    String? id,
    String? name,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? address,
    String? gender,
    String? email,
    UserRole? role,
    String? profilePicture,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      // // createdAt: createdAt,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      role: role ?? this.role,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      dateOfBirth,
      phoneNumber,
      address,
      gender,
      email,
      name,
      role,
    ];
  }
}
