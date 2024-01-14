import 'package:intl/intl.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/functions/truncate_dashboard_map.dart';
import '../../../user_model.dart';

class AdminModel extends UserModel {
  const AdminModel({
    super.id = '-1',
    super.dateOfBirth,
    super.phoneNumber = '',
    super.userName = '',
    super.address = '',
    super.gender = '',
    super.email = '',
    super.displayName = '',
    super.role = 'admin',
    super.profilePicture = '',
  });

  factory AdminModel.empty() {
    return const AdminModel(
      id: '',
      userName: '',
      dateOfBirth: null,
      phoneNumber: '',
      address: '',
      gender: '',
      email: '',
      displayName: '',
      role: '',
    );
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
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
      role: map['role'] ?? 'admin',
    );
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
    };

    return truncateMap(map);
  }

  @override
  AdminModel copyWith({
    String? id,
    String? userName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? address,
    bool? paymentStatus,
    String? gender,
    String? email,
    String? displayName,
    String? role,
    String? profilePicture,
  }) {
    return AdminModel(
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
  String toString() {
    return 'AdminModel{adminId: $id, userName: $userName, dateOfBirth: $dateOfBirth, '
        'phoneNumber: $phoneNumber, address: $address, '
        'gender: $gender, email: $email, displayName: $displayName, role: $role}';
  }
}
