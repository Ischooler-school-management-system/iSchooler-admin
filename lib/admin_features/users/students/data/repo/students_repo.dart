import '../../../../../common/comon_features/error_handling/data/models/error_handling_model.dart';
import '../../../../../common/comon_features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../../common/network/educonnect_response.dart';
import '../../../admins/data/network/admins_network.dart';
import '../../../user_model.dart';
import '../models/all_students_model.dart';
import '../models/student_model.dart';

class StudentRepository {
  final ErrorHandlingRepository _alertHandlingRepository;
  final AdminNetwork _userNetwork;

  StudentRepository(
      ErrorHandlingRepository alertHandlingRepository, AdminNetwork userNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _userNetwork = userNetwork;

  Future<void> addStudent({required StudentModel student}) async {
    try {
      _userNetwork.addUser(user: student);
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
      EduconnectResponse response =
          await _userNetwork.getAllUsersData(role: UserRole.student);
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
