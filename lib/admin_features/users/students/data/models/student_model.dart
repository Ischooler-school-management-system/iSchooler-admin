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
    required super.createdAt,
  });

  factory StudentModel.empty() {
    return StudentModel(
      id: '-1',
      name: 'name',
      classModel: ClassModel.empty(),
      userModel: UserModel.empty(),
      createdAt: DateTime.now(),
    );
  }

  factory StudentModel.dummy() {
    return StudentModel(
      id: '123456',
      name: 'ziad',
      classModel: ClassModel.empty(),
      userModel: UserModel.dummy().copyWith(role: UserRole.student),
      createdAt: DateTime.now(),
    );
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    final userModel =
        UserModel.fromMap(map['school_user']).copyWith(role: UserRole.student);
    return StudentModel(
      id: userModel.id,
      name: userModel.name,
      userModel: userModel,
      classModel: ClassModel.fromMap(map['class'] ?? {}),
      paymentStatus: map['paymentStatus'] ?? false,
      createdAt: DateTime.now(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'class_id': classModel.id,
      'payment_status': paymentStatus,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap({int? limit}) {
    var map = {
      EduconnectConstants.localization().name: name,
      EduconnectConstants.localization().id: id,
      EduconnectConstants.localization().gender: userModel.gender,
      EduconnectConstants.localization().classes: classModel.name,
    };

    return map;
  }

  @override
  StudentModel copyWith({
    String? name,
    ClassModel? classModel,
    bool? paymentStatus,
    UserModel? userModel,
  }) {
    return StudentModel(
      id: id,
      name: name ?? this.name,
      classModel: classModel ?? this.classModel,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      userModel: userModel ?? this.userModel,
      createdAt: createdAt,
    );
  }
}
