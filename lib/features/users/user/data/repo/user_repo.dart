import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../common/features/error_handling/data/models/error_handling_model.dart';
import '../../../../../common/features/error_handling/data/repo/error_handling_repo.dart';
import '../models/user_model.dart';
import '../network/user_network.dart';

class UserRepository {
  final ErrorHandlingRepository _alertHandlingRepository;
  final UserNetwork _userNetwork;

  UserRepository(
      ErrorHandlingRepository alertHandlingRepository, UserNetwork userNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _userNetwork = userNetwork;

  Future<User?> storeUserData({required UserModel user}) async {
    try {
      _userNetwork.storeUserData(user: user);
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'user_repo > storeUserData',
        showToast: true,
      );
    }
    return null;
  }
}
