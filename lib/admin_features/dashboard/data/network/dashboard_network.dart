import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../common/comon_features/error_handling/data/models/error_handling_model.dart';
import '../../../../common/comon_features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../common/educonnect_model.dart';
import '../../../../common/network/collections.dart';
import '../../../../common/network/educonnect_response.dart';
import '../../logic/cubit/all_cubit.dart';

class DashboardNetwork implements EduconnectNetwork {
  final ErrorHandlingRepository _alertHandlingRepository;

  DashboardNetwork(ErrorHandlingRepository alertHandlingRepository)
      : _alertHandlingRepository = alertHandlingRepository;

  @override
  Future<EduconnectResponse> getAllItems(
      {required EduconnectAllModel model}) async {
    EduconnectResponse response = EduconnectResponse.empty();
    try {
      String? collectionName =
          EduconnectNetworkHelper.getCollectionByModel(model);
      if (collectionName == null) {
        if (collectionName == null) {
          throw Exception('unable to get (model = $model) data');
        }
      }
      final CollectionReference<Map<String, dynamic>> reference =
          EduconnectNetworkHelper.fireStoreInstance.collection(collectionName);
      final QuerySnapshot<Map<String, dynamic>> query = await reference.get();
      response = EduconnectResponse.fromCollection(query);
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'admin_network > getAllData',
        showToast: true,
      );
    }
    return response;
  }

  @override
  Future<bool> addItem({required EduconnectModel model}) async {
    bool userStored = false;
    try {
      String? collectionName =
          EduconnectNetworkHelper.getCollectionByModel(model);
      if (collectionName == null) {
        throw Exception('unable to add (model = $model) data');
      }
      final credentialCollection =
          EduconnectNetworkHelper.fireStoreInstance.collection(collectionName);
      await credentialCollection.doc(model.id).set(model.toMap());
      userStored = true;
    } catch (e) {
      _alertHandlingRepository.addError(
        // 'unable to add user',
        /* developerMessage: */ e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'admin_network > addData > catch',
        showToast: true,
      );
    }

    return userStored;
  }

  @override
  Future<bool> deleteItem({required EduconnectModel model}) async {
    bool userStored = false;
    try {
      String? collectionName =
          EduconnectNetworkHelper.getCollectionByModel(model);
      if (collectionName == null) {
        throw Exception('unable to delete (model = $model) data');
      }
      final credentialCollection =
          EduconnectNetworkHelper.fireStoreInstance.collection(collectionName);
      await credentialCollection.doc(model.id).delete();
      userStored = true;
    } catch (e) {
      _alertHandlingRepository.addError(
        // 'unable to add user',
        /* developerMessage: */ e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'admin_network > delete > catch',
        showToast: true,
      );
    }

    return userStored;
  }
}
