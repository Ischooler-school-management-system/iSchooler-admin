import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dashboard/logic/cubit/all_cubit.dart';
import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../data/models/all_students_model.dart';
import '../../data/models/student_model.dart';
import '../../data/repo/students_repo.dart';

part 'all_students_state.dart';

class AllStudentsCubit extends EduconnectCubit {
  final StudentRepository _studentRepository;
  final LoadingRepository _loadingRepository;

  AllStudentsCubit(
    StudentRepository studentRepository,
    LoadingRepository loadingRepository,
  )   : _studentRepository = studentRepository,
        _loadingRepository = loadingRepository,
        super(AllStudentsState.init());

  @override
  Future<void> getAllData() async {
    _loadingRepository.startLoading(LoadingType.normal);
    AllStudentsModel response = await _studentRepository.getAllStudentsData();
    emit((state as AllStudentsState).updateAllStudents(response));
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> add({required EduconnectModel educonnectModel}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _studentRepository.addStudent(
        student: educonnectModel as StudentModel);
    await getAllData();
    // _loadingRepository.stopLoading();
  }
}
