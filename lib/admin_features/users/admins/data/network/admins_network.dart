import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../common/comon_features/error_handling/data/models/error_handling_model.dart';
import '../../../../../common/comon_features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../../common/network/collections.dart';
import '../../../../../common/network/educonnect_response.dart';
import '../../../user_model.dart';

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
  Future<EduconnectResponse> getAllUsersData({required UserRole role}) async {
    EduconnectResponse response = EduconnectResponse.empty();
    try {
      String? collectionName = EduconnectNetwork.getUserCollectionName(role);
      if (collectionName == null) {
        if (collectionName == null) {
          throw Exception('unable to get users data');
        }
      }
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

  Future<void> addUser({required UserModel user}) async {
    try {
      String? collectionName =
          EduconnectNetwork.getUserCollectionName(user.role);
      if (collectionName == null) {
        throw Exception('unable to add user');
      }
      final credentialCollection =
          EduconnectNetwork.fireStoreInstance.collection(collectionName);
      credentialCollection.doc(user.id).set(user.toMap());
    } catch (e) {
      _alertHandlingRepository.addError(
        // 'unable to add user',
        /* developerMessage: */ e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'admin_network > storeAdminData > catch',
        showToast: true,
      );
    }

    // return null;
  }
}
