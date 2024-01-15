import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_admin/common/network/educonnect_response.dart';

import '../../../../../common/comon_features/error_handling/data/models/error_handling_model.dart';
import '../../../../../common/comon_features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../../common/network/collections.dart';
import '../models/student_model.dart';

class StudentNetwork {
  final ErrorHandlingRepository _alertHandlingRepository;

  StudentNetwork(ErrorHandlingRepository alertHandlingRepository)
      : _alertHandlingRepository = alertHandlingRepository;
/* 

 Future<void> getCollectionData() async {
    String collectionName =
        'students'; // Replace with your actual collection name

    try {
      CollectionReference collectionReference =
          EduconnectNetwork.fireStoreInstance.collection(collectionName);
      QuerySnapshot querySnapshot = await collectionReference.get();

      EduconnectResponse educonnectResponse =
          EduconnectResponse.fromCollection(querySnapshot);

    } catch (e) {
      Madpoly.print('Error: $e');
    }
  }

 */
  Future<EduconnectResponse> getAllStudentsData() async {
    EduconnectResponse response = EduconnectResponse.empty();
    try {
      final CollectionReference<Map<String, dynamic>> reference =
          EduconnectNetwork.fireStoreInstance
              .collection(EduconnectNetwork.students);
      final QuerySnapshot<Map<String, dynamic>> query = await reference.get();
      response = EduconnectResponse.fromCollection(query);
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'student_network > storeStudentData',
        showToast: true,
      );
    }
    return response;
  }

  Future<void> addStudent({required StudentModel student}) async {
    try {
      final credentialCollection = EduconnectNetwork.fireStoreInstance
          .collection(EduconnectNetwork.students);
      credentialCollection.doc().set(student.toMap());
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'student_network > storeStudentData',
        showToast: true,
      );
    }
    // return null;
  }
}
