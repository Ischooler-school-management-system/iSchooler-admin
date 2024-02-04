import '../../../../../common/educonnect_model.dart';
import '../../../user_model.dart';

class InstructorModel extends EduconnectModel {
  final UserModel userModel;

  const InstructorModel({
    required super.id,
    required super.name,
    required this.userModel,
  });

  factory InstructorModel.empty() {
    return InstructorModel(
      id: '-1',
      name: 'name',
      userModel: UserModel.empty(),
    );
  }

  factory InstructorModel.dummy() {
    return InstructorModel(
      id: '123456',
      name: 'JohnDoe',
      userModel: UserModel.dummy().copyWith(role: UserRole.instructor),
    );
  }

  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    final userModel = UserModel.fromMap(map['school_user'])
        .copyWith(role: UserRole.instructor);
    return InstructorModel(
      id: userModel.id,
      name: userModel.name,
      userModel: userModel,
    );
  }

  @override
  InstructorModel copyWith({
    String? id,
    String? name,
    UserModel? userModel,
  }) {
    return InstructorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userModel: userModel ?? this.userModel,
    );
  }
}
