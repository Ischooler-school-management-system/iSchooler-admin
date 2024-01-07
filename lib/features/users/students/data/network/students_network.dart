import '../../../../../common/features/error_handling/data/models/error_handling_model.dart';
import '../../../../../common/features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../../common/network/collections.dart';
import '../models/student_model.dart';

class StudentNetwork {
  final ErrorHandlingRepository _alertHandlingRepository;

  StudentNetwork(ErrorHandlingRepository alertHandlingRepository)
      : _alertHandlingRepository = alertHandlingRepository;

  Future<StudentModel?> getStudentData({required StudentModel student}) async {
    try {
      //  final credentialCollection= AppCollections.createCollection(AppCollections.students);
      //  credentialCollection.doc(student.id).set(student.toMap());
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'student_network > storeStudentData',
        showToast: true,
      );
    }
    return null;
  }

  Future<StudentModel?> storeStudentData(
      {required StudentModel student}) async {
    try {
      final credentialCollection =
          AppCollections.createCollection(AppCollections.students);
      credentialCollection.doc(student.id).set(student.toMap());
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'student_network > storeStudentData',
        showToast: true,
      );
    }
    return null;
  }
}
