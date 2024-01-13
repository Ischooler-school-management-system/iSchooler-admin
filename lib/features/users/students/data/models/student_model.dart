// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/functions/truncate_dashboard_map.dart';

class StudentModel extends Equatable {
  final String id;
  final String studentName;
  final DateTime? dateOfBirth;
  final String classId;
  final String gradeId;
  final String phoneNumber;
  final String address;
  final bool paymentStatus;
  final String gender;
  final String email;
  final String displayName;
  final String role; // Added role field

  const StudentModel({
    this.id = '-1',
    this.studentName = '',
    this.dateOfBirth,
    this.classId = '',
    this.gradeId = '',
    this.phoneNumber = '',
    this.address = '',
    this.paymentStatus = false,
    this.gender = '',
    this.email = '',
    this.displayName = '',
    this.role = 'student', // Default value for role is 'student'
  });

  factory StudentModel.empty() {
    return const StudentModel(
      id: '',
      studentName: '',
      dateOfBirth: null,
      classId: '',
      gradeId: '',
      phoneNumber: '',
      address: '',
      paymentStatus: false,
      gender: '',
      email: '',
      displayName: '',
      role: 'student', // Default value for role is 'student'
    );
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] ?? '',
      studentName: map['studentname'] ?? '',
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
      role: map['role'] ?? 'student', // Default value for role is 'student'
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'studentname': studentName,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'classId': classId,
      'gradeId': gradeId,
      'phoneNumber': phoneNumber,
      'address': address,
      'paymentStatus': paymentStatus,
      'gender': gender,
      'email': email,
      'displayName': displayName,
      'role': role,
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
      EduconnectConstants.localization().payment_status:
          paymentStatus.toString(),
      // 'role': role,
    };

    // return limit != null ? truncateMap(limit, map) : map;
    return truncateMap(map);
  }

  StudentModel copyWith({
    String? id,
    String? studentName,
    DateTime? dateOfBirth,
    String? classId,
    String? gradeId,
    String? phoneNumber,
    String? address,
    bool? paymentStatus,
    String? gender,
    String? email,
    String? displayName,
    String? role,
  }) {
    return StudentModel(
      id: id ?? this.id,
      studentName: studentName ?? this.studentName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      classId: classId ?? this.classId,
      gradeId: gradeId ?? this.gradeId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      role: role ?? this.role,
    );
  }

  @override
  String toString() {
    return 'StudentModel{studentId: $id, studentname: $studentName, dateOfBirth: $dateOfBirth, '
        'classId: $classId, gradeId: $gradeId, phoneNumber: $phoneNumber, address: $address, '
        'paymentStatus: $paymentStatus, gender: $gender, email: $email, displayName: $displayName, role: $role}';
  }

  @override
  List<Object?> get props {
    return [
      id,
      studentName,
      dateOfBirth,
      classId,
      gradeId,
      phoneNumber,
      address,
      paymentStatus,
      gender,
      email,
      displayName,
      role,
    ];
  }
}
