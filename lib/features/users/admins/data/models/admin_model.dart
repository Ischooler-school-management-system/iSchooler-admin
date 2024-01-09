// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/functions/truncate_map.dart';

class AdminModel extends Equatable {
  final String id;
  final String adminName;
  final DateTime? dateOfBirth;
  final String phoneNumber;
  final String address;
  final String gender;
  final String email; // Added email field
  final String displayName; // Added displayName field

  const AdminModel({
    this.id = '-1',
    this.adminName = '',
    this.dateOfBirth,
    this.phoneNumber = '',
    this.address = '',
    this.gender = '',
    this.email = '',
    this.displayName = '',
  });

  factory AdminModel.empty() {
    return const AdminModel(
      id: '',
      adminName: '',
      dateOfBirth: null,
      phoneNumber: '',
      address: '',
      gender: '',
      email: '',
      displayName: '',
    );
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id'] ?? '',
      adminName: map['adminname'] ?? '',
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adminname': adminName,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
      'email': email,
      'displayName': displayName,
    };
  }

  Map<String, dynamic> toDisplayMap({int? limit}) {
    var map = {
      EduconnectConstants.localization().name: displayName,
      EduconnectConstants.localization().id: id,
      EduconnectConstants.localization().gender: gender,
      EduconnectConstants.localization().email: email,
      EduconnectConstants.localization().phone_number: phoneNumber,
      EduconnectConstants.localization().address: address,
      EduconnectConstants.localization().date_of_birth:
          DateFormat('dd MMM, yyyy').format(dateOfBirth ?? DateTime(500)),
    };

    return limit != null ? truncateMap(limit, map) : map;
  }

  AdminModel copyWith({
    String? id,
    String? adminName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? address,
    String? gender,
    String? email,
    String? displayName,
  }) {
    return AdminModel(
      id: id ?? this.id,
      adminName: adminName ?? this.adminName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
    );
  }

  @override
  String toString() {
    return 'AdminModel{adminId: $id, adminname: $adminName, dateOfBirth: $dateOfBirth, '
        'phoneNumber: $phoneNumber, address: $address, '
        'gender: $gender, email: $email, displayName: $displayName}';
  }

  @override
  List<Object?> get props {
    return [
      id,
      adminName,
      dateOfBirth,
      phoneNumber,
      address,
      gender,
      email,
      displayName,
    ];
  }
}
