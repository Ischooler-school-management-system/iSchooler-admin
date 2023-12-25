import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppCollections {
  static const users = 'users';

  static final FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;

  static CollectionReference<Map<String, dynamic>> createCollection(
      String collectionPath) {
    return fireStoreInstance.collection(collectionPath);
  }
}
