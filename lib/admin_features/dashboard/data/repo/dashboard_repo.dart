import '../../../../common/comon_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../../common/comon_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../../common/educonnect_model.dart';
import '../../../../common/madpoly.dart';
import '../../../../common/network/educonnect_response.dart';
import '../../logic/cubit/all_cubit.dart';
import '../network/dashboard_network.dart';

class DashboardRepository implements EduconnectRepository {
  final AlertHandlingRepository _alertHandlingRepository;
  final DashboardNetwork _adminNetwork;

  DashboardRepository(AlertHandlingRepository alertHandlingRepository,
      DashboardNetwork adminNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminNetwork = adminNetwork;

  @override
  Future<EduconnectModelList> getAllItems(
      {required EduconnectModelList model}) async {
    EduconnectModelList listModel = EduconnectModelList.empty();
    Madpoly.print(
      ' model >> ${model.runtimeType}',
      tag: 'repo > getAllItems ',
      developer: "Ziad",
      // showToast: true,
    );
    try {
      EduconnectResponse response =
          await _adminNetwork.getAllItems(model: model);
      // if (response.hasData) {

      listModel = model.fromMapToChild(response.data);
      Madpoly.print(
        listModel,
        tag: 'dashboard_repo > getAllItems',
        developer: "Ziad",
      );
      _alertHandlingRepository.addError(
        'data retrieved sucessfully',
        AlertHandlingTypes.Alert,
        tag: 'dashboard_repo > getAllItems',
        showToast: true,
      );
      // }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'dashboard_repo > getAllItems',
        showToast: true,
      );
    }
    return listModel;
  }

  @override
  Future<bool> addItem(
      {required EduconnectModel model, bool addWithId = false}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.addItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Admin Data Stored Successfully',
          AlertHandlingTypes.Alert,
          tag: 'dashboard_repo > addItem',
          showToast: true,
        );
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'dashboard_repo > addItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  @override
  Future<bool> updateItem({required EduconnectModel model}) async {
    bool requestSuccess = false;
    try {
      bool successfulRequest = await _adminNetwork.updateItem(model: model);
      if (successfulRequest) {
        _alertHandlingRepository.addError(
          'Admin Data Stored Successfully',
          AlertHandlingTypes.Alert,
          tag: 'dashboard_repo > updateItem',
          showToast: true,
        );
        requestSuccess = true;
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'dashboard_repo > updateItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  @override
  Future<bool> deleteItem({required EduconnectModel model}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.deleteItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Admin Data Stored Successfully',
          AlertHandlingTypes.Alert,
          tag: 'dashboard_repo > storeAdminData',
          showToast: true,
        );
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'dashboard_repo > storeAdminData',
        showToast: true,
      );
    }
    return requestSuccess;
  }
}
