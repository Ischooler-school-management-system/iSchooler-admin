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

  Future<StudentModel?> storeStudentData(
      {required StudentModel student}) async {
    try {
      _studentNetwork.storeStudentData(student: student);
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'student_repo > storeStudentData',
        showToast: true,
      );
    }
    return null;
  }
}
