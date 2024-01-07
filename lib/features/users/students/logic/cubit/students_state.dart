part of 'students_cubit.dart';

enum StudentStatus { init, updated, loaded, failed }
// @immutable

class StudentState extends Equatable {
  final StudentModel studentModel;
  final StudentStatus status;

  const StudentState({
    required this.studentModel,
    required this.status,
  });

  factory StudentState.init() {
    return StudentState(
      studentModel: StudentModel.empty(),
      status: StudentStatus.init,
    );
  }

  StudentState updateStudent(StudentModel studentModel) {
    return _copyWith(
      studentModel: studentModel,
      status: StudentStatus.loaded,
    );
  }

  StudentState _copyWith({
    StudentModel? studentModel,
    StudentStatus? status,
  }) {
    return StudentState(
      studentModel: studentModel ?? this.studentModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [studentModel];
}
