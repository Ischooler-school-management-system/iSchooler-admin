import '../../../../../common/educonnect_model.dart';
import '../../../user_model.dart';

class InstructorModel extends EduconnectModel {
  final UserModel userModel;

  const InstructorModel({
    required super.id,
    required super.name,
    required this.userModel,
    required super.createdAt,
  });

  factory InstructorModel.empty() {
    return InstructorModel(
      id: '-1',
      name: 'name',
      userModel: UserModel.empty(),
      createdAt: DateTime.now(),
    );
  }

  factory InstructorModel.dummy() {
    return InstructorModel(
      id: '123456',
      name: 'JohnDoe',
      userModel: UserModel.dummy().copyWith(role: UserRole.instructor),
      createdAt: DateTime.now(),
    );
  }

  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    final userModel = UserModel.fromMap(map['school_user'])
        .copyWith(role: UserRole.instructor);
    return InstructorModel(
      id: userModel.id,
      name: userModel.name,
      userModel: userModel,
      createdAt: DateTime.now(),
    );
  }

  @override
  InstructorModel copyWith({
    String? name,
    UserModel? userModel,
  }) {
    return InstructorModel(
      id: id,
      name: name ?? this.name,
      userModel: userModel ?? this.userModel,
      createdAt: createdAt,
    );
  }
}
