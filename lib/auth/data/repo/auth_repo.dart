import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common/comon_features/error_handling/data/models/error_handling_model.dart';
import '../../../../common/comon_features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../common/madpoly.dart';
import '../../../admin_features/users/admins/data/repo/admins_repo.dart';
import '../../../admin_features/users/user_model.dart';
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

  Future<UserModel> _handleAuthOperation({
    required Future<User?> Function() authOperation,
    required String tag,
  }) async {
    User? firebaseUser;
    try {
      firebaseUser = await authOperation();
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'auth_repo > $tag',
        showToast: true,
      );
    }
    UserModel newUser = UserModel.empty();
    if (firebaseUser != null) {
      newUser = newUser.copyWith(
        id: firebaseUser.uid,
      );
    }
    return newUser;
  }

  Future<UserModel> signUp(
      {required UserModel user, required String password}) async {
    UserModel newUser = await _handleAuthOperation(
      authOperation: () =>
          _authNetwork.signUp(email: user.email, password: password),
      tag: 'signup',
    );
    // add the new created user id to the user data
    newUser = user.copyWith(id: newUser.id);
    // add the ful new user to firestore
    _adminsRepository.addUser(user: newUser);
    return newUser;
  }

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    UserModel? newUser = await _handleAuthOperation(
      authOperation: () {
        return _authNetwork.signIn(email: email, password: password);
      },
      tag: 'signin',
    );

    return newUser;
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
