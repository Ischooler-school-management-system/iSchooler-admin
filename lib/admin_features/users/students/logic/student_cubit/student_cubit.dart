import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../data/models/student_model.dart';
import '../../data/repo/students_repo.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentRepository _studentRepository;
  final LoadingRepository _loadingRepository;

  StudentCubit(
    StudentRepository studentRepository,
    LoadingRepository loadingRepository,
  )   : _studentRepository = studentRepository,
        _loadingRepository = loadingRepository,
        super(StudentState.init());
}
