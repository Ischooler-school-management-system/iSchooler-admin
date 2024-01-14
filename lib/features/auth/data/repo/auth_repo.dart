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

  Future<AdminModel> _handleAuthOperation({
    required Future<User?> Function() authOperation,
    required String tag,
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

  Future<AdminModel> signUp(
      {required String email, required String password}) async {
    AdminModel adminModel = await _handleAuthOperation(
      authOperation: () {
        return _authNetwork.signUp(email: email, password: password);
      },
      tag: 'signup',
    );

    _adminsRepository.addAdmin(admin: adminModel);
    return adminModel;
  }

  Future<AdminModel> signIn(
      {required String email, required String password}) async {
    AdminModel adminModel = await _handleAuthOperation(
      authOperation: () {
        return _authNetwork.signIn(email: email, password: password);
      },
      tag: 'signin',
    );
    return adminModel;
  }

  Future<bool> signOut() async {
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
    return instance.currentUser == null;
  }
}
