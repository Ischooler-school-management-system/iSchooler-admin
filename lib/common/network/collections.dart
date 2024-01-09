import 'package:cloud_firestore/cloud_firestore.dart';

abstract class EduconnectNetwork {
  static const users = 'users';
  static const students = 'students';
  static const admins = 'admins';

  static final FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
}
