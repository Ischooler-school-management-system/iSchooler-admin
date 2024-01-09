import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/features/loading/data/models/loading_model.dart';
import '../../../../../common/features/loading/data/repo/loading_repo.dart';
import '../../data/models/all_students_model.dart';
import '../../data/models/student_model.dart';
import '../../data/repo/students_repo.dart';

part 'all_students_state.dart';

class AllStudentsCubit extends Cubit<AllStudentsState> {
  final StudentRepository _studentRepository;
  final LoadingRepository _loadingRepository;

  AllStudentsCubit(
    StudentRepository studentRepository,
    LoadingRepository loadingRepository,
  )   : _studentRepository = studentRepository,
        _loadingRepository = loadingRepository,
        super(AllStudentsState.init());

  Future<void> getAllStudentsData() async {
    _loadingRepository.startLoading(LoadingType.normal);
    AllStudentsModel response = await _studentRepository.getAllStudentsData();
    emit(state.updateAllStudents(response));
    _loadingRepository.stopLoading();
  }

  Future<void> addStudent({required StudentModel student}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _studentRepository.addStudent(student: student);
    await getAllStudentsData();
    // _loadingRepository.stopLoading();
  }
}
