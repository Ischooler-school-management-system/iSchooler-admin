import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../common/features/error_handling/data/models/error_handling_model.dart';
import '../../../../../common/features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../../common/network/collections.dart';
import '../../../../../common/network/educonnect_response.dart';
import '../models/admin_model.dart';

class AdminNetwork {
  final ErrorHandlingRepository _alertHandlingRepository;

  AdminNetwork(ErrorHandlingRepository alertHandlingRepository)
      : _alertHandlingRepository = alertHandlingRepository;
/* 

 Future<void> getCollectionData() async {
    String collectionName =
        'admins'; // Replace with your actual collection name

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
  Future<EduconnectResponse> getAllAdminsData() async {
    EduconnectResponse response = EduconnectResponse.empty();
    try {
      final CollectionReference<Map<String, dynamic>> reference =
          EduconnectNetwork.fireStoreInstance
              .collection(EduconnectNetwork.admins);
      final QuerySnapshot<Map<String, dynamic>> query = await reference.get();
      response = EduconnectResponse.fromCollection(query);
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'admin_network > storeAdminData',
        showToast: true,
      );
    }
    return response;
  }

  Future<void> storeAdminData({required AdminModel admin}) async {
    try {
      final credentialCollection = EduconnectNetwork.fireStoreInstance
          .collection(EduconnectNetwork.admins);
      credentialCollection.doc().set(admin.toMap());
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'admin_network > storeAdminData',
        showToast: true,
      );
    }
    // return null;
  }
}
