import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common/comon_features/error_handling/data/models/error_handling_model.dart';
import '../../../../common/comon_features/error_handling/data/repo/error_handling_repo.dart';

class AuthNetwork {
  final ErrorHandlingRepository _alertHandlingRepository;

  AuthNetwork(ErrorHandlingRepository alertHandlingRepository)
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
          ErrorHandlingTypes.ServerError,
          tag: 'auth_network > signup',
          showToast: true,
        );
      } else if (e.code == 'email-already-in-use') {
        _alertHandlingRepository.addError(
          'The account already exists for that email.',
          ErrorHandlingTypes.ServerError,
          tag: 'auth_network > signup',
          showToast: true,
        );
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
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
            ErrorHandlingTypes.ServerError,
            showToast: true,
          );
          return null;
        } else if (e.code == 'wrong-password') {
          _alertHandlingRepository.addError(
            tag: 'auth_network > signIn',
            'Wrong password provided for that user.',
            ErrorHandlingTypes.ServerError,
            showToast: true,
          );
        }
      }

      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'auth_network > signin',
        showToast: true,
      );
      return null;
    }
    return null;
  }
}
