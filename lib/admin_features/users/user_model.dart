import '../../common/educonnect_constants.dart';
import '../../common/educonnect_model.dart';
import '../../common/functions/truncate_dashboard_map.dart';

enum UserRole { admin, instructor, student, none }

class UserModel extends EduconnectModel {
  // final String id;
  final DateTime? dateOfBirth;
  final String phoneNumber;
  final String address;
  final String gender;
  final String email;
  // final String displayName;
  // final String name;
  final UserRole role; // Added role field
  final String profilePicture;
  const UserModel({
    required super.name,
    required super.id,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.email,
    // required this.displayName,
    required this.role,
    required this.profilePicture,
  });

  factory UserModel.empty() {
    return const UserModel(
        id: '',
        name: '',
        dateOfBirth: null,
        phoneNumber: '',
        address: '',
        gender: '',
        email: '',
        // displayName: '',
        role: UserRole.none,
        profilePicture: '');
  }

  factory UserModel.dummy() {
    return UserModel(
      name: 'JohnDoe',
      id: '123456',
      dateOfBirth: DateTime(1990, 5, 15),
      phoneNumber: '555-1234',
      address: '123 Main St, City',
      gender: 'Male',
      email: 'john.doe@example.com',
      // displayName: 'John Doe',
      role: UserRole.none,
      profilePicture: 'path/to/profile_picture.jpg',
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    UserRole userRole = UserRole.none;
    if (map['role'] != null) {
      switch (map['role']) {
        case 'admin':
          userRole = UserRole.admin;
        case 'teacher':
          userRole = UserRole.instructor;
        case 'student':
          userRole = UserRole.student;
        default:
          userRole = UserRole.none;
      }
    }
    return UserModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      dateOfBirth: map['date_of_birth'] != null
          ? DateTime.parse(map['date_of_birth'])
          : null,
      phoneNumber: map['phone_number'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      // // displayName: map['displayName'] ?? '',
      role: userRole,
      profilePicture: map['profile_picture'] ?? '',
    );
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
      'email': email,
      // // 'displayName': displayName,
      'role': role.name,
      'profilePicture': profilePicture,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap({int? limit}) {
    var map = {
      // '': profilePicture,
      EduconnectConstants.localization().name: name,
      EduconnectConstants.localization().id: id,
      EduconnectConstants.localization().gender: gender,
      EduconnectConstants.localization().email: email,
      // EduconnectConstants.localization().phone_number: phoneNumber,
      // EduconnectConstants.localization().address: address,
      // EduconnectConstants.localization().date_of_birth:
      // DateFormat('dd MMM, yyyy').format(dateOfBirth ?? DateTime(500)),
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
    bool? paymentStatus,
    String? gender,
    String? email,
    // String? displayName,
    UserRole? role,
    String? profilePicture,
  }) {
    return UserModel(
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
  List<Object?> get props {
    return [
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
