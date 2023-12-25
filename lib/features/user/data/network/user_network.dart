import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common/features/error_handling/data/models/error_handling_model.dart';
import '../../../../common/features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../common/network/collections.dart';
import '../models/user_model.dart';

class UserNetwork {
  final ErrorHandlingRepository _alertHandlingRepository;

  UserNetwork(ErrorHandlingRepository alertHandlingRepository)
      : _alertHandlingRepository = alertHandlingRepository;


  Future<User?> getUserData({required UserModel user}) async {
    try {
    //  final credentialCollection= AppCollections.createCollection(AppCollections.users);
    //  credentialCollection.doc(user.id).set(user.toMap());
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'user_network > storeUserData',
        showToast: true,
      );
    }
    return null;
  }
  Future<User?> storeUserData({required UserModel user}) async {
    try {
     final credentialCollection= AppCollections.createCollection(AppCollections.users);
     credentialCollection.doc(user.id).set(user.toMap());
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'user_network > storeUserData',
        showToast: true,
      );
    }
    return null;
  }
}
