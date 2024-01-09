import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_admin/features/users/students/data/models/student_model.dart';
import 'package:school_admin/features/users/students/data/repo/students_repo.dart';

import '../../../../common/features/error_handling/data/models/error_handling_model.dart';
import '../../../../common/features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../common/madpoly.dart';
import '../network/auth_network.dart';

class AuthRepository {
  final ErrorHandlingRepository _alertHandlingRepository;
  final AuthNetwork _authNetwork;
  final StudentRepository _studentsRepository;
  AuthRepository(ErrorHandlingRepository alertHandlingRepository,
      AuthNetwork authNetwork, StudentRepository studentsRepository)
      : _alertHandlingRepository = alertHandlingRepository,
        _studentsRepository = studentsRepository,
        _authNetwork = authNetwork;
  final FirebaseAuth instance = FirebaseAuth.instance;
  Future<void> _handleAuthOperation(
    Future<User?> Function() authOperation,
    String tag, {
    required String email,
    required String password,
  }) async {
    try {
      final User? firebaseStudents = await authOperation();

      if (firebaseStudents != null) {
        StudentModel studentsModel = StudentModel(
          id: firebaseStudents.uid,
          email: firebaseStudents.email ?? '',
          displayName: firebaseStudents.displayName ?? '',
        );
        _studentsRepository.addStudent(student: studentsModel);
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'auth_repo > $tag',
        showToast: true,
      );
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    await _handleAuthOperation(
      () => _authNetwork.signUp(
        email: email,
        password: password,
      ),
      'signup',
      email: email,
      password: password,
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    await _handleAuthOperation(
      () => _authNetwork.signIn(email: email, password: password),
      'signin',
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    try {
      await instance.signOut();
      Madpoly.print(
        'signing out now',
        tag: 'auth_repo > signOut',
        developer: "Ziad",
        showToast: true,
      );
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'auth_repo > signin',
        showToast: true,
      );
    }
  }
}
