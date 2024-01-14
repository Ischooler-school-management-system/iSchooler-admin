import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common/features/error_handling/data/models/error_handling_model.dart';
import '../../../../common/features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../common/madpoly.dart';
import '../../../users/admins/data/models/admin_model.dart';
import '../../../users/admins/data/repo/admins_repo.dart';
import '../network/auth_network.dart';

class AuthRepository {
  final ErrorHandlingRepository _alertHandlingRepository;
  final AuthNetwork _authNetwork;
  final AdminRepository _adminsRepository;
  AuthRepository(ErrorHandlingRepository alertHandlingRepository,
      AuthNetwork authNetwork, AdminRepository adminsRepository)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminsRepository = adminsRepository,
        _authNetwork = authNetwork;
  final FirebaseAuth instance = FirebaseAuth.instance;
  Future<AdminModel> _handleAuthOperation(
    Future<User?> Function() authOperation,
    String tag, {
    required String email,
    required String password,
  }) async {
    AdminModel adminModel = AdminModel.empty();
    try {
      final User? firebaseAdmins = await authOperation();

      if (firebaseAdmins != null) {
        adminModel = AdminModel(
          id: firebaseAdmins.uid,
          email: firebaseAdmins.email ?? '',
          displayName: firebaseAdmins.displayName ?? '',
        );
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'auth_repo > $tag',
        showToast: true,
      );
    }
    return adminModel;
  }

  Future<void> signUp({required String email, required String password}) async {
    AdminModel adminModel = await _handleAuthOperation(
      () => _authNetwork.signUp(
        email: email,
        password: password,
      ),
      'signup',
      email: email,
      password: password,
    );

    _adminsRepository.addAdmin(admin: adminModel);
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
