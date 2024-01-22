import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../common/comon_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../../common/comon_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../../common/educonnect_model.dart';
import '../../../../common/madpoly.dart';
import '../../../../common/network/educonnect_network_helper.dart';
import '../../../../common/network/educonnect_response.dart';
import '../../logic/cubit/all_cubit.dart';

class DashboardNetwork implements EduconnectNetwork {
  final AlertHandlingRepository _alertHandlingRepository;

  DashboardNetwork(AlertHandlingRepository alertHandlingRepository)
      : _alertHandlingRepository = alertHandlingRepository;

  @override
  Future<EduconnectResponse> getAllItems(
      {required EduconnectModelList model}) async {
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
      Madpoly.print(
        'request will be sent is >>  get(), collection:$collectionName,',
        tag: 'dashboard_network > getAllItems',
        color: MadpolyColor.purple,
        developer: "Ziad",
      );
      final QuerySnapshot<Map<String, dynamic>> query = await reference.get();
      response = EduconnectResponse.fromCollection(query);
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'admin_network > getAllData',
        showToast: true,
      );
    }
    return response;
  }

  @override
  Future<bool> addItem(
      {required EduconnectModel model, bool addWithId = false}) async {
    bool userStored = false;
    String? docName = addWithId ? model.id : null;
    try {
      String? collectionName =
          EduconnectNetworkHelper.getCollectionByModel(model);
      if (collectionName == null) {
        throw Exception('unable to add (model = $model) data');
      }
      final credentialCollection =
          EduconnectNetworkHelper.fireStoreInstance.collection(collectionName);
      Map<String, dynamic> data = model.toMap();

      Madpoly.print(
        'request will be sent is >> set(), collection:$collectionName, addWithId = $addWithId document:$docName,',
        tag: 'dashboard_network > add',
        color: MadpolyColor.purple,
        developer: "Ziad",
      );
      await credentialCollection.doc(docName).set(data);
      // await credentialCollection.doc(model.id).set(model.toMap());
      userStored = true;
    } catch (e) {
      _alertHandlingRepository.addError(
        // 'unable to add user',
        /* developerMessage: */ e.toString(),
        AlertHandlingTypes.ServerError,
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
      Madpoly.print(
        'request will be sent is >> delete(), collection:$collectionName, document:${model.id},',
        tag: 'dashboard_network > deleteItem',
        color: MadpolyColor.purple,
        developer: "Ziad",
      );
      await credentialCollection.doc(model.id).delete();
      userStored = true;
    } catch (e) {
      _alertHandlingRepository.addError(
        'unable to add user',
        developerMessage: e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'admin_network > delete > catch',
        showToast: true,
      );
    }

    return userStored;
  }
}
