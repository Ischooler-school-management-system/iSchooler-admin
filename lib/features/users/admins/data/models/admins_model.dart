// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/functions/truncate_map.dart';

class AllAdminsModel extends Equatable {
  final List<AdminModel> items;

  const AllAdminsModel({required this.items});
  factory AllAdminsModel.empty() {
    return const AllAdminsModel(items: []);
  }
  factory AllAdminsModel.fromMap(Map map) {
    final List<AdminModel> items = List<AdminModel>.from(
      map['items'].map(
        (item) => AdminModel.fromMap(item),
      ),
    );
    return AllAdminsModel(items: items);
  }
  @override
  List<Object> get props => [items];
}

class AdminModel extends Equatable {
  final String id;
  final String adminName;
  final DateTime? dateOfBirth;
  final String classId;
  final String gradeId;
  final String phoneNumber;
  final String address;
  final bool paymentStatus;
  final String gender;
  final String email; // Added email field
  final String displayName; // Added displayName field

  const AdminModel({
    this.id = '-1',
    this.adminName = '',
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

  factory AdminModel.empty() {
    return const AdminModel(
      id: '',
      adminName: '',
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

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id'] ?? '',
      adminName: map['adminname'] ?? '',
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
      // 'id': id,
      'adminname': adminName,
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

  Map<String, dynamic> toDisplayMap({int? limit}) {
    var map = {
      EduconnectConstants.localization().name: displayName,
      EduconnectConstants.localization().id: id,
      EduconnectConstants.localization().gender: gender,
      EduconnectConstants.localization().email: email,
      // EduconnectConstants.localization().adminname: adminname,
      // EduconnectConstants.localization().classId: classId,
      // EduconnectConstants.localization().gradeId: gradeId,
      EduconnectConstants.localization().phone_number: phoneNumber,
      EduconnectConstants.localization().address: address,
      EduconnectConstants.localization().date_of_birth:
          DateFormat('dd MMM, yyyy').format(dateOfBirth ?? DateTime(500)),
      EduconnectConstants.localization().payment_status: paymentStatus,
    };

    return limit != null ? truncateMap(limit, map) : map;
  }

  AdminModel copyWith({
    String? id,
    String? adminName,
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
    return AdminModel(
      id: id ?? this.id,
      adminName: adminName ?? this.adminName,
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
    return 'AdminModel{adminId: $id, adminname: $adminName, dateOfBirth: $dateOfBirth, '
        'classId: $classId, gradeId: $gradeId, phoneNumber: $phoneNumber, address: $address, '
        'paymentStatus: $paymentStatus, gender: $gender, email: $email, displayName: $displayName}';
  }

  @override
  List<Object?> get props {
    return [
      id,
      adminName,
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
