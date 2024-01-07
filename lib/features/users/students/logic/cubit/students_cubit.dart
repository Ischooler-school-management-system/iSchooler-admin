import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/student_model.dart';

part 'students_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.init());

  Future<void> getStudentData() async {}
}
