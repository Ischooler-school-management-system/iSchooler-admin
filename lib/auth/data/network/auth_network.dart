import 'package:gotrue/src/types/user.dart';

import '../../../common/comon_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../common/comon_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../common/network/educonnect_network_helper.dart';

class AuthNetwork {
  final AlertHandlingRepository _alertHandlingRepository;

  AuthNetwork(AlertHandlingRepository alertHandlingRepository)
      : _alertHandlingRepository = alertHandlingRepository;

  // final FirebaseAuth instance = FirebaseAuth.instance;
  final instance = SupabaseCridentials.authInstance;

  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      final userCredential = await SupabaseCridentials.authInstance.signUp(
        email: email,
        password: password,
      );
      final User? supabaseUser = userCredential.user;
      if (supabaseUser != null) {
        return supabaseUser;
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'auth_network > signup',
        showToast: true,
      );
    }

    return null;
  }

  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      final userCredential =
          await SupabaseCridentials.authInstance.signInWithPassword(
        email: email,
        password: password,
      );
      final User? supabaseUser = userCredential.user;
      if (supabaseUser != null) {
        return supabaseUser;
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'auth_network > signin',
        showToast: true,
      );
      return null;
    }
    return null;
  }
}
