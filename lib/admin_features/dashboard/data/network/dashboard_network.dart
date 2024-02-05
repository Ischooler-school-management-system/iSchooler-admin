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
      ({String? selectQuery, String? tableName}) tableQueryData =
          EduconnectNetworkHelper.getTableQueryData(model);

      if (tableQueryData.tableName == null) {
        if (tableQueryData.tableName == null) {
          throw Exception('unable to get (model = $model) data');
        }
      }
      /*  final CollectionReference<Map<String, dynamic>> reference =
          EduconnectNetworkHelper.fireStoreInstance.collection(tableQueryData.tableName); */
      Madpoly.print(
        'request will be sent is >>  get(), '
        'tableQueryData:$tableQueryData,',
        tag: 'dashboard_network > getAllItems',
        // color: MadpolyColor.purple,
        isLog: true,

        developer: "Ziad",
      );
      final List<Map<String, dynamic>> query = await SupabaseCridentials
          .supabase
          .from(tableQueryData.tableName!)
          .select(tableQueryData.selectQuery!);
      Madpoly.print(
        'query= $query',
        tag: 'dashboard_network > getAllItems',
        developer: "Ziad",
      );
      response = EduconnectResponse(hasData: true, data: {'items': query});
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
  Future<bool> addItem({required EduconnectModel model}) async {
    bool dataStored = false;
    // String? docName = addWithId ? model.id : null;
    try {
      var tableQueryData = EduconnectNetworkHelper.getTableQueryData(model);
      if (tableQueryData.tableName == null) {
        throw Exception('unable to add (model = $model) data');
      }
      Map<String, dynamic> data = model.toMap();
      Madpoly.print(
        'request will be sent is >> update(), '
        'collection:$tableQueryData, ',
        tag: 'dashboard_network > add',
        // color: MadpolyColor.purple,
        isLog: true,
        developer: "Ziad",
      );
      final credentialCollection = await SupabaseCridentials.supabase
          .from(tableQueryData.tableName!)
          .insert(data);
      Madpoly.print(
        credentialCollection,
        tag: 'dashboard_network > add',
        developer: "Ziad",
      );
      // await credentialCollection.doc(model.id).set(model.toMap());
      dataStored = true;
    } catch (e) {
      _alertHandlingRepository.addError(
        // 'unable to add user',
        /* developerMessage: */ e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'admin_network > addData > catch',
        showToast: true,
      );
    }

    return dataStored;
  }

  @override
  Future<bool> updateItem({required EduconnectModel model}) async {
    bool dataUpdated = false;
    // String? docName = addWithId ? model.id : null;
    try {
      var tableQueryData = EduconnectNetworkHelper.getTableQueryData(model);
      if (tableQueryData.tableName == null) {
        throw Exception('unable to add (model = $model) data');
      }
      Map<String, dynamic> data = model.toMapFromChild();
      Madpoly.print(
        'request will be sent is >> update(), '
        'table: ${tableQueryData.tableName}, '
        'data = $data',
        tag: 'dashboard_network > update',
        // color: MadpolyColor.purple,
        isLog: true,
        developer: "Ziad",
      );
      final credentialCollection = await SupabaseCridentials.supabase
          .from(tableQueryData.tableName!)
          .update(data)
          .match(model.idToMap());
      Madpoly.print(
        credentialCollection,
        tag: 'dashboard_network > update',
        developer: "Ziad",
      );
      // await credentialCollection.doc(model.id).set(model.toMap());
      dataUpdated = true;
    } catch (e) {
      _alertHandlingRepository.addError(
        // 'unable to add user',
        /* developerMessage: */ e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'admin_network > addData > catch',
        showToast: true,
      );
    }

    return dataUpdated;
  }

  @override
  Future<bool> deleteItem({required EduconnectModel model}) async {
    bool dataDeleted = false;
    try {
      var tableQueryData = EduconnectNetworkHelper.getTableQueryData(model);
      if (tableQueryData.tableName == null) {
        throw Exception('unable to delete (model = $model) data');
      }
      Madpoly.print(
        'request will be sent is >> delete(), '
        'collection:$tableQueryData, '
        'document:${model.id},',
        tag: 'dashboard_network > deleteItem',
        isLog: true,
        // color: MadpolyColor.purple,
        developer: "Ziad",
      );
      final credentialCollection = await SupabaseCridentials.supabase
          .from(tableQueryData.tableName!)
          .delete()
          .match({'id': model.id});
      Madpoly.print(
        credentialCollection,
        tag: 'dashboard_network > delete',
        developer: "Ziad",
      );

      dataDeleted = true;
    } catch (e) {
      _alertHandlingRepository.addError(
        'unable to add user',
        developerMessage: e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'admin_network > delete > catch',
        showToast: true,
      );
    }

    return dataDeleted;
  }
}
