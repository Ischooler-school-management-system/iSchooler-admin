import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../common/educonnect_constants.dart';
import '../../common/functions/truncate_dashboard_map.dart';

enum UserRole { admin, teacher, student, none }

class UserModel extends Equatable {
  final String id;
  final DateTime? dateOfBirth;
  final String phoneNumber;
  final String address;
  final String gender;
  final String email;
  final String displayName;
  final String userName;
  final UserRole role; // Added role field
  final String profilePicture;
  const UserModel({
    required this.userName,
    required this.id,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.email,
    required this.displayName,
    required this.role,
    required this.profilePicture,
  });

  factory UserModel.empty() {
    return const UserModel(
        id: '',
        userName: '',
        dateOfBirth: null,
        phoneNumber: '',
        address: '',
        gender: '',
        email: '',
        displayName: '',
        role: UserRole.none,
        profilePicture: '');
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    UserRole userRole = UserRole.none;
    if (map['role'] != null) {
      switch (map['role']) {
        case 'admin':
          userRole = UserRole.admin;
        case 'teacher':
          userRole = UserRole.teacher;
        case 'student':
          userRole = UserRole.student;
        default:
          userRole = UserRole.none;
      }
    }
    return UserModel(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      role: userRole,
      profilePicture: map['profilePicture'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
      'email': email,
      'displayName': displayName,
      'role': role.name,
      'profilePicture': profilePicture,
    };
  }

  Map<String, dynamic> toDisplayMap({int? limit}) {
    var map = {
      '': profilePicture,
      EduconnectConstants.localization().name: displayName,
      EduconnectConstants.localization().id: id,
      EduconnectConstants.localization().gender: gender,
      EduconnectConstants.localization().email: email,
      EduconnectConstants.localization().phone_number: phoneNumber,
      EduconnectConstants.localization().address: address,
      EduconnectConstants.localization().date_of_birth:
          DateFormat('dd MMM, yyyy').format(dateOfBirth ?? DateTime(500)),
    };

    return truncateMap(map);
  }

  UserModel copyWith({
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
    return UserModel(
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

  @override
  List<Object?> get props {
    return [
      id,
      dateOfBirth,
      phoneNumber,
      address,
      gender,
      email,
      displayName,
      role,
    ];
  }
}