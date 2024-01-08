import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_admin/features/users/students/data/repo/students_repo.dart';

import '../../../../../common/features/loading/data/models/loading_model.dart';
import '../../../../../common/features/loading/data/repo/loading_repo.dart';
import '../../../../auth/data/repo/auth_repo.dart';
import '../../data/models/student_model.dart';

part 'students_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentRepository _studentRepository;
  final LoadingRepository _loadingRepository;

  StudentCubit(
    StudentRepository studentRepository,
    LoadingRepository loadingRepository,
  )   : _studentRepository = studentRepository,
        _loadingRepository = loadingRepository,
        super(StudentState.init());

  Future<void> storeStudentData({required StudentModel student}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _studentRepository.storeStudentData(student: student);
    _loadingRepository.stopLoading();
  }
}
