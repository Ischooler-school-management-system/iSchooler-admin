import 'package:firebase_auth/firebase_auth.dart';

import '../../../common/comon_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../common/comon_features/alert_handling/data/repo/alert_handling_repo.dart';

class AuthNetwork {
  final AlertHandlingRepository _alertHandlingRepository;

  AuthNetwork(AlertHandlingRepository alertHandlingRepository)
      : _alertHandlingRepository = alertHandlingRepository;

  final FirebaseAuth instance = FirebaseAuth.instance;

  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return firebaseUser;
        // return UserModel(
        //   id: firebaseUser.uid,
        //   email: firebaseUser.email ?? '',
        //   displayName: firebaseUser.displayName ?? '',
        // );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _alertHandlingRepository.addError(
          'The password provided is too weak.',
          AlertHandlingTypes.ServerError,
          tag: 'auth_network > signup',
          showToast: true,
        );
      } else if (e.code == 'email-already-in-use') {
        _alertHandlingRepository.addError(
          'The account already exists for that email.',
          AlertHandlingTypes.ServerError,
          tag: 'auth_network > signup',
          showToast: true,
        );
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
      final UserCredential userCredential =
          await instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return firebaseUser;
        // return UserModel(
        //   id: firebaseUser.uid,
        //   email: firebaseUser.email ?? '',
        //   displayName: firebaseUser.displayName ?? '',
        // );
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          _alertHandlingRepository.addError(
            tag: 'auth_network > signIn',
            'No user found for that email.',
            AlertHandlingTypes.ServerError,
            showToast: true,
          );
          return null;
        } else if (e.code == 'wrong-password') {
          _alertHandlingRepository.addError(
            tag: 'auth_network > signIn',
            'Wrong password provided for that user.',
            AlertHandlingTypes.ServerError,
            showToast: true,
          );
        }
      }

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
