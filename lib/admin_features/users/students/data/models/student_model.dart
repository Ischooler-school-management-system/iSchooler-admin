// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../classes/data/models/class_model.dart';
import '../../../../grades/data/models/grade_model.dart';
import '../../../user_model.dart';

class StudentModel extends UserModel {
  final ClassModel classModel;
  final bool paymentStatus;

  const StudentModel({
    required super.id,
    required super.dateOfBirth,
    required super.phoneNumber,
    required super.address,
    required super.gender,
    required super.email,
    required super.role,
    required super.name,
    required super.profilePicture,
    required this.classModel,
    required this.paymentStatus,
  });
  @override
  factory StudentModel.empty() {
    return StudentModel(
        id: '',
        name: '',
        classModel: ClassModel.empty(),
        // gradeModel: GradeModel.empty(),
        dateOfBirth: null,
        phoneNumber: '',
        address: '',
        gender: '',
        email: '',
        // displayName: '',
        paymentStatus: false,
        role: UserRole.student,
        profilePicture: '');
  }
  @override
  factory StudentModel.dummy() {
    return StudentModel(
      id: '',
      name: 'ziad',
      classModel: ClassModel.empty(),
      // gradeModel: GradeModel.empty(),
      dateOfBirth: null,
      phoneNumber: '0123786323',
      address: 'a .main b',
      gender: 'male',
      email: 'user@mail.com',
      // displayName: '',
      role: UserRole.student,
      paymentStatus: false,
      profilePicture: '',
    );
  }
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    UserModel userModel =
        UserModel.fromMap(map).copyWith(role: UserRole.student);

    return StudentModel(
      id: userModel.id,
      name: userModel.name,
      dateOfBirth: userModel.dateOfBirth,
      phoneNumber: userModel.phoneNumber,
      address: userModel.address,
      gender: userModel.gender,
      email: userModel.email,
      role: userModel.role,
      profilePicture: userModel.profilePicture,
      classModel: ClassModel.fromMap(map['class'] ?? {}),
      paymentStatus: map['payment_status'] ?? false,
    );
  }
  StudentModel copyFromUser(UserModel userModel) {
    return copyWith(
      id: userModel.id,
      name: userModel.name,
      dateOfBirth: userModel.dateOfBirth,
      phoneNumber: userModel.phoneNumber,
      address: userModel.address,
      gender: userModel.gender,
      email: userModel.email,
      role: userModel.role,
      profilePicture: userModel.profilePicture,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> userMap = super.toMap();
    return {
      ...userMap,
      'class_id': classModel.id,
      'payment_status': paymentStatus,
    };
  }

  @override
  StudentModel copyWith({
    String? id,
    String? name,
    DateTime? dateOfBirth,
    ClassModel? classModel,
    GradeModel? gradeModel,
    String? phoneNumber,
    String? address,
    bool? paymentStatus,
    String? gender,
    String? email,
    // String? displayName,
    UserRole? role,
    String? profilePicture, // Add this line
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      classModel: classModel ?? this.classModel,
      // gradeModel: gradeModel ?? this.gradeModel,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      // // // displayName: displayName ?? this.displayName,
      role: role ?? this.role,
      profilePicture: profilePicture ?? this.profilePicture, // Add this line
    );
  }

  @override
  String toString() {
    return 'StudentModel{studentId: $id, name: $name, dateOfBirth: $dateOfBirth, '
        'classId: $classModel, phoneNumber: $phoneNumber, address: $address, '
        'paymentStatus: $paymentStatus, gender: $gender, email: $email, role: ${role.name}}';
  }

  @override
  List<Object?> get props {
    return [
      dateOfBirth,
      phoneNumber,
      address,
      gender,
      email,
      name,
      role,
      name,
      classModel,
      /* gradeModel, */ paymentStatus,
    ];
  }
}
