import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common/comon_features/error_handling/data/models/error_handling_model.dart';
import '../../../../common/comon_features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../common/madpoly.dart';
import '../../../admin_features/dashboard/data/repo/dashboard_repo.dart';
import '../../../admin_features/users/user_model.dart';
import '../network/auth_network.dart';

class AuthRepository {
  final ErrorHandlingRepository _alertHandlingRepository;
  final AuthNetwork _authNetwork;
  final DashboardRepository _adminsRepository;
  AuthRepository(ErrorHandlingRepository alertHandlingRepository,
      AuthNetwork authNetwork, DashboardRepository adminsRepository)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminsRepository = adminsRepository,
        _authNetwork = authNetwork;

  final FirebaseAuth instance = FirebaseAuth.instance;

  Future<UserModel> signUp(
      {required UserModel user, required String password}) async {
    UserModel newUser = UserModel.empty();
    try {
      if (user.role == UserRole.none) {
        throw Exception('unable to sign up (role = ${user.role.name})');
      }

      User? firebaseUser =
          await _authNetwork.signUp(email: user.email, password: password);
      // add the new created user id to the user data
      if (firebaseUser != null) {
        newUser = user.copyWith(id: firebaseUser.uid);
        // add the ful new user to firestore
        _adminsRepository.addItem(model: newUser);
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'auth_repo > signUp',
        showToast: true,
      );
    }
    return newUser;
  }

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    UserModel newUser = UserModel.empty();

    try {
      var firebaseUser =
          await _authNetwork.signIn(email: email, password: password);
      if (firebaseUser != null) {
        newUser = newUser.copyWith(id: firebaseUser.uid);
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'auth_repo > sign in',
        showToast: true,
      );
    }
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
