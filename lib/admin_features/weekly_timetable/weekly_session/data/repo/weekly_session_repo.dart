import '../../../../../common/common_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../../../common/common_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../../../common/madpoly.dart';
import '../../../../../common/network/educonnect_response.dart';
import '../models/weekly_session_model.dart';
import '../models/weekly_sessions_list_model.dart';
import '../network/weekly_session_network.dart';

class WeeklySessionsRepository {
  final AlertHandlingRepository _alertHandlingRepository;
  final WeeklySessionsNetwork _adminNetwork;

  WeeklySessionsRepository(AlertHandlingRepository alertHandlingRepository,
      WeeklySessionsNetwork adminNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminNetwork = adminNetwork;

  Future<WeeklySessionsListModel> getAllItems({
    required String classId,
    required String weekdayId,
  }) async {
    WeeklySessionsListModel listModel = WeeklySessionsListModel.empty();
    // Madpoly.print(
    //   ' model >> ${model.runtimeType}',
    //   inspectObject: model,
    //   tag: 'repo > getAllItems ',
    //   developer: "Ziad",
    //   // showToast: true,
    // );
    try {
      IschoolerResponse response = await _adminNetwork.getAllItems(
          classId: classId, weekdayId: weekdayId);
      // if (response.hasData) {

      listModel = WeeklySessionsListModel.fromMap(response.data);
      Madpoly.print(
        'response = ',
        color: MadpolyColor.green,
        inspectObject: listModel,
        tag: 'weeklysessions_repo > getAllItems',
        developer: "Ziad",
      );
      _alertHandlingRepository.addError(
        'data retrieved sucessfully',
        AlertHandlingTypes.Alert,
        tag: 'weeklysessions_repo > getAllItems',
        // showToast: true,
      );
      // }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weeklysessions_repo > getAllItems',
        showToast: true,
      );
    }
    return listModel;
  }

  Future<bool> addItem(
      {required WeeklySessionModel model, bool addWithId = false}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.addItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Added Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weeklysessions_repo > addItem',
          showToast: true,
        );
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weeklysessions_repo > addItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  Future<bool> updateItem({required WeeklySessionModel model}) async {
    bool requestSuccess = false;
    try {
      bool successfulRequest = await _adminNetwork.updateItem(model: model);
      if (successfulRequest) {
        _alertHandlingRepository.addError(
          'Data Updated Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weeklysessions_repo > updateItem',
          // showToast: true,
        );
        requestSuccess = true;
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weeklysessions_repo > updateItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  Future<bool> deleteItem({required WeeklySessionModel model}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.deleteItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Deleted Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weeklysessions_repo > delete',
          showToast: true,
        );
      } else {
        throw Exception('unable to delete item');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weeklysessions_repo > delete',
        showToast: true,
      );
    }
    return requestSuccess;
  }
}
