// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../../../common/functions/truncate_map.dart';

class UserModel extends Equatable {
  final String id;
  final String username;
  final DateTime? dateOfBirth;
  final String classId;
  final String gradeId;
  final String phoneNumber;
  final String address;
  final bool paymentStatus;
  final String gender;
  final String email; // Added email field
  final String displayName; // Added displayName field

  const UserModel({
    this.id = '-1',
    this.username = '',
    this.dateOfBirth,
    this.classId = '',
    this.gradeId = '',
    this.phoneNumber = '',
    this.address = '',
    this.paymentStatus = false,
    this.gender = '',
    this.email = '',
    this.displayName = '',
  });

  factory UserModel.empty() {
    return const UserModel(
      id: '',
      username: '',
      dateOfBirth: null,
      classId: '',
      gradeId: '',
      phoneNumber: '',
      address: '',
      paymentStatus: false,
      gender: '',
      email: '',
      displayName: '',
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      classId: map['classId'] ?? '',
      gradeId: map['gradeId'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      paymentStatus: map['paymentStatus'] ?? false,
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'classId': classId,
      'gradeId': gradeId,
      'phoneNumber': phoneNumber,
      'address': address,
      'paymentStatus': paymentStatus,
      'gender': gender,
      'email': email,
      'displayName': displayName,
    };
  }

  Map<String, dynamic> toDisplayMap({bool showLess = false}) {
    var map = {
      'displayName': displayName,
      'id': id,
      'gender': gender,
      'email': email,
      // 'username': username,
      // 'classId': classId,
      // 'gradeId': gradeId,
      'phoneNumber': phoneNumber,
      'address': address,
      'dateOfBirth':
          DateFormat('dd MMM, yyyy').format(dateOfBirth ?? DateTime(500)),

      'paymentStatus': paymentStatus,
    };

    return showLess ? truncateMap(4, map) : map;
  }

  UserModel copyWith({
    String? id,
    String? username,
    DateTime? dateOfBirth,
    String? classId,
    String? gradeId,
    String? phoneNumber,
    String? address,
    bool? paymentStatus,
    String? gender,
    String? email,
    String? displayName,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      classId: classId ?? this.classId,
      gradeId: gradeId ?? this.gradeId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
    );
  }

  @override
  String toString() {
    return 'UserModel{userId: $id, username: $username, dateOfBirth: $dateOfBirth, '
        'classId: $classId, gradeId: $gradeId, phoneNumber: $phoneNumber, address: $address, '
        'paymentStatus: $paymentStatus, gender: $gender, email: $email, displayName: $displayName}';
  }

  @override
  List<Object?> get props {
    return [
      id,
      username,
      dateOfBirth,
      classId,
      gradeId,
      phoneNumber,
      address,
      paymentStatus,
      gender,
      email,
      displayName,
    ];
  }
}
