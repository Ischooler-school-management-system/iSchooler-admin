import 'package:school_admin/common/network/educonnect_response.dart';
import 'package:school_admin/features/users/students/data/models/all_students_model.dart';

import '../../../../../common/features/error_handling/data/models/error_handling_model.dart';
import '../../../../../common/features/error_handling/data/repo/error_handling_repo.dart';
import '../models/student_model.dart';
import '../network/students_network.dart';

class StudentRepository {
  final ErrorHandlingRepository _alertHandlingRepository;
  final StudentNetwork _studentNetwork;

  StudentRepository(ErrorHandlingRepository alertHandlingRepository,
      StudentNetwork studentNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _studentNetwork = studentNetwork;

  Future<void> storeStudentData({required StudentModel student}) async {
    try {
      _studentNetwork.storeStudentData(student: student);
      _alertHandlingRepository.addError(
        'Student Data Stored Successfully',
        ErrorHandlingTypes.Alert,
        tag: 'student_repo > storeStudentData',
        showToast: true,
      );
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'student_repo > storeStudentData',
        showToast: true,
      );
    }
  }

  Future<AllStudentsModel> getAllStudentsData() async {
    var students = AllStudentsModel.empty();
    try {
      EduconnectResponse response = await _studentNetwork.getAllStudentsData();
      if (response.hasData) {
        students = AllStudentsModel.fromMap(response.data);
        _alertHandlingRepository.addError(
          'Students retrieved sucessfully',
          ErrorHandlingTypes.Alert,
          tag: 'student_repo > getAllStudentsData',
          showToast: true,
        );
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'student_repo > getAllStudentsData',
        showToast: true,
      );
    }
    return students;
  }
}
