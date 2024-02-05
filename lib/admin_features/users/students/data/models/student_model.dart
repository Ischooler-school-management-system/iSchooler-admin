// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:school_admin/common/educonnect_model.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../classes/data/models/class_model.dart';
import '../../../user_model.dart';

class StudentModel extends EduconnectModel {
  final ClassModel classModel;
  final bool paymentStatus;
  final UserModel userModel;

  const StudentModel({
    required super.id,
    required super.name,
    required this.classModel,
    required this.userModel,
    this.paymentStatus = false,
  });

  @override
  factory StudentModel.empty() {
    return StudentModel(
      id: '-1',
      name: 'name',
      classModel: ClassModel.empty(),
      userModel: UserModel.empty(),
    );
  }

  @override
  factory StudentModel.dummy() {
    return StudentModel(
      id: '123456',
      name: 'ziad',
      classModel: ClassModel.empty(),
      userModel: UserModel.dummy().copyWith(role: UserRole.student),
    );
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    final userModel = UserModel.fromMap(map['school_user'])
        .copyWith(role: UserRole.instructor);
    return StudentModel(
      id: userModel.id,
      name: userModel.name,
      userModel: userModel,
      classModel: ClassModel.fromMap(map['class'] ?? {}),
      paymentStatus: map['paymentStatus'] ?? false,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'user_id': super.id,
      'class_id': classModel.id,
      'payment_status': paymentStatus,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap({int? limit}) {
    var map = {
      // '': profilePicture,
      EduconnectConstants.localization().name: name,
      EduconnectConstants.localization().id: id,
      EduconnectConstants.localization().gender: userModel.gender,
      EduconnectConstants.localization().classes: classModel.name,
      // EduconnectConstants.localization().phone_number: phoneNumber,
      // EduconnectConstants.localization().address: address,
      // EduconnectConstants.localization().date_of_birth:
      // DateFormat('dd MMM, yyyy').format(dateOfBirth ?? DateTime(500)),
    };

    return map;
  }

  @override
  StudentModel copyWith({
    String? id,
    String? name,
    ClassModel? classModel,
    bool? paymentStatus,
    UserModel? userModel,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      classModel: classModel ?? this.classModel,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      userModel: userModel ?? this.userModel,
    );
  }
}
