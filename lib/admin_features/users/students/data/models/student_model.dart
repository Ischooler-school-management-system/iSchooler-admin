// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/functions/truncate_dashboard_map.dart';
import '../../../../dashboard/data/models/all_models.dart';
import '../../../user_model.dart';

class StudentModel extends UserModel {
  final ClassModel classModel;
  final GradeModel gradeModel;
  final bool paymentStatus;

  const StudentModel({
    required this.classModel,
    required this.gradeModel,
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
    return StudentModel(
        id: '',
        userName: '',
        classModel: ClassModel.empty(),
        gradeModel: GradeModel.empty(),
        dateOfBirth: null,
        phoneNumber: '',
        address: '',
        gender: '',
        email: '',
        displayName: '',
        role: UserRole.student,
        profilePicture: '');
  }
  @override
  factory StudentModel.dummy() {
    return StudentModel(
        id: '',
        userName: 'ziad',
        classModel: ClassModel.empty(),
        gradeModel: GradeModel.empty(),
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
      classModel: ClassModel.fromMap(map['class'] ?? {}),
      gradeModel: GradeModel.fromMap(map['grade'] ?? {}),
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
      'classId': classModel.toMap(),
      'gradeId': gradeModel.toDisplayMap(),
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
      // '': profilePicture,
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
        'classId: $classModel, gradeId: $gradeModel, phoneNumber: $phoneNumber, address: $address, '
        'paymentStatus: $paymentStatus, gender: $gender, email: $email, displayName: $displayName, role: ${role.name}}';
  }

  @override
  StudentModel copyWith({
    String? id,
    String? userName,
    DateTime? dateOfBirth,
    ClassModel? classModel,
    GradeModel? gradeModel,
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
      classModel: classModel ?? this.classModel,
      gradeModel: gradeModel ?? this.gradeModel,
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
    return super.props
      ..addAll([userName, classModel, gradeModel, paymentStatus]);
  }
}
