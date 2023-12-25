import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common/features/error_handling/data/models/error_handling_model.dart';
import '../../../../common/features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../common/madpoly.dart';
import '../../../user/data/models/user_model.dart';
import '../../../user/data/repo/user_repo.dart';
import '../network/auth_network.dart';

class AuthRepository {
  final ErrorHandlingRepository _alertHandlingRepository;
  final AuthNetwork _authNetwork;
  final UserRepository _userRepository;
  AuthRepository(ErrorHandlingRepository alertHandlingRepository,
      AuthNetwork authNetwork, UserRepository userRepository)
      : _alertHandlingRepository = alertHandlingRepository,
        _userRepository = userRepository,
        _authNetwork = authNetwork;
  final FirebaseAuth instance = FirebaseAuth.instance;
  Future<void> _handleAuthOperation(
    Future<User?> Function() authOperation,
    String tag, {
    required String email,
    required String password,
  }) async {
    try {
      final User? firebaseUser = await authOperation();

      if (firebaseUser != null) {
        UserModel userModel = UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email,
          displayName: firebaseUser.displayName,
        );
        _userRepository.storeUserData(user: userModel);
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
      () => _authNetwork.signUp(email: email, password: password),
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
