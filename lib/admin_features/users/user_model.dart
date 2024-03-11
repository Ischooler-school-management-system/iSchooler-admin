import '../../common/ischooler_constants.dart';
import '../../common/ischooler_model.dart';
import '../../common/functions/ischooler_date_time_helper.dart';

enum UserRole { admin, instructor, student, none }

class UserModel extends IschoolerModel {
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
      id: '-1',
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
    IschoolerModel ischoolerModel = IschoolerModel.fromMap(map);
    // return StudentModel(
    return UserModel(
      id: ischoolerModel.id,
      name: ischoolerModel.name,

      // createdAt: DateTime.parse(map['created_at']),
      // dateOfBirth: DateTime.now(),
      dateOfBirth: IschoolerDateAndTimeHelper.toDateTime(map['date_of_birth']),
      phoneNumber: map['phone_number'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      role: UserRole.none,
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
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'phone_number': phoneNumber,
      'address': address,
      'profile_picture': profilePicture,
      // 'role': role.toString().split('.').last, // Convert enum to string
      // 'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    var map = {
      IschoolerConstants.localization().name: name,
      IschoolerConstants.localization().id: id,
      IschoolerConstants.localization().gender: gender,
      IschoolerConstants.localization().email: email,
    };

    // return truncateMap(map);
    return map;
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
    var userModel = UserModel(
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

    return userModel;
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
