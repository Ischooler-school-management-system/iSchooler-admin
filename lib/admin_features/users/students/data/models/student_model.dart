// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/functions/truncate_dashboard_map.dart';
import '../../../user_model.dart';

class StudentModel extends UserModel {
  final String classId;
  final String gradeId;
  final bool paymentStatus;

  const StudentModel({
    this.classId = '',
    this.gradeId = '',
    super.id = '-1',
    super.dateOfBirth,
    super.phoneNumber = '',
    super.address = '',
    this.paymentStatus = false,
    super.gender = '',
    super.email = '',
    super.displayName = '',
    super.role = UserRole.student,
    super.userName = '',
    super.profilePicture = '',
  });
  @override
  factory StudentModel.empty() {
    return const StudentModel(
        id: '',
        userName: '',
        classId: '',
        gradeId: '',
        dateOfBirth: null,
        phoneNumber: '',
        address: '',
        gender: '',
        email: '',
        displayName: '',
        role: UserRole.student,
        profilePicture: '');
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
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
      role: map['role'] == UserRole.student.name
          ? UserRole.student
          : UserRole.none,
    );
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'classId': classId,
      'gradeId': gradeId,
      'phoneNumber': phoneNumber,
      'address': address,
      'paymentStatus': paymentStatus,
      'gender': gender,
      'email': email,
      'displayName': displayName,
      'role': role.name,
      'profilePicture': profilePicture,
    };
  }

  @override
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
      EduconnectConstants.localization().payment_status:
          paymentStatus.toString(),
    };

    return truncateMap(map);
  }

  @override
  String toString() {
    return 'StudentModel{studentId: $id, userName: $userName, dateOfBirth: $dateOfBirth, '
        'classId: $classId, gradeId: $gradeId, phoneNumber: $phoneNumber, address: $address, '
        'paymentStatus: $paymentStatus, gender: $gender, email: $email, displayName: $displayName, role: ${role.name}}';
  }

  @override
  StudentModel copyWith({
    String? id,
    String? userName,
    DateTime? dateOfBirth,
    String? classId,
    String? gradeId,
    String? phoneNumber,
    String? address,
    bool? paymentStatus,
    String? gender,
    String? email,
    String? displayName,
    UserRole? role,
    String? profilePicture, // Add this line
  }) {
    return StudentModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
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
      profilePicture: profilePicture ?? this.profilePicture, // Add this line
    );
  }

  @override
  List<Object?> get props {
    return super.props..addAll([userName, classId, gradeId, paymentStatus]);
  }
}
