import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_admin/admin_features/users/user_model.dart';

abstract class EduconnectNetwork {
  static const users = 'users';
  static const students = 'students';
  static const admins = 'admins';
  static String? getUserCollectionName(UserRole role) {
    switch (role) {
      case UserRole.student:
        return students;
      case UserRole.admin:
        return admins;
      default:
        return null;
    }
  }

  static final FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
}
