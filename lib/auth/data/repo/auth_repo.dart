import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/common_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../common/common_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../../common/madpoly.dart';
import '../../../admin_features/dashboard/data/repo/dashboard_repo.dart';
import '../../../admin_features/users/user_model.dart';
import '../../../common/network/educonnect_network_helper.dart';
import '../network/auth_network.dart';

class AuthRepository {
  final AlertHandlingRepository _alertHandlingRepository;
  final AuthNetwork _authNetwork;
  final DashboardRepository _adminsRepository;
  AuthRepository(AlertHandlingRepository alertHandlingRepository,
      AuthNetwork authNetwork, DashboardRepository adminsRepository)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminsRepository = adminsRepository,
        _authNetwork = authNetwork;

  Future<UserModel> signUp(
      {required UserModel user, required String password}) async {
    UserModel newUser = UserModel.empty();
    try {
      if (user.role == UserRole.none) {
        throw Exception('unable to sign up (role = ${user.role.name})');
      }

      User? supabaseUser =
          await _authNetwork.signUp(email: user.email, password: password);
      Madpoly.print(
        'supabaseUser = $supabaseUser',
        tag: 'auth_repo > signUp',
        developer: "Ziad",
      );
      // add the new created user id to the user data
      if (supabaseUser != null) {
        newUser = user.copyWith(id: supabaseUser.id);
        // add the ful new user to firestore
        _adminsRepository.addItem(model: newUser, addWithId: true);
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
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
      var supabaseUser =
          await _authNetwork.signIn(email: email, password: password);
      Madpoly.print(
        'supabaseUser = $supabaseUser',
        tag: 'auth_repo > signUp',
        developer: "Ziad",
      );
      if (supabaseUser != null) {
        newUser = newUser.copyWith(id: supabaseUser.id);
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'auth_repo > sign in',
        showToast: true,
      );
    }
    return newUser;
  }

  Future<bool> signOut() async {
    try {
      await SupabaseCredentials.authInstance.signOut();
      Madpoly.print(
        'signing out now',
        tag: 'auth_repo > signOut',
        developer: "Ziad",
        showToast: true,
      );
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'auth_repo > signin',
        showToast: true,
      );
    }
    return SupabaseCredentials.authInstance.currentUser == null;
  }
}
