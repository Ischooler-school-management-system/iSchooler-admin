import '../../../../../common/common_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../../../common/common_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../../../common/madpoly.dart';
import '../../../../../common/network/educonnect_response.dart';
import '../../../weekly_timetable_day/data/models/weekly_timetable_day_model.dart';
import '../models/weekly_session_model.dart';
import '../models/weekly_sessions_list_model.dart';
import '../network/weekly_session_network.dart';

class WeeklySessionsRepository {
  final AlertHandlingRepository _alertHandlingRepository;
  final WeeklySessionsNetwork _weeklySessionsNetwork;

  WeeklySessionsRepository(AlertHandlingRepository alertHandlingRepository,
      WeeklySessionsNetwork weeklySessionsNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _weeklySessionsNetwork = weeklySessionsNetwork;

  Future<WeeklySessionsListModel> getAllItems({
    required WeeklyTimetableDayModel weeklyTimetableDayModel,
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
      IschoolerResponse response = await _weeklySessionsNetwork.getAllItems(
        weeklyTimetableDayModel: weeklyTimetableDayModel,
      );
      // if (response.hasData) {

      listModel = WeeklySessionsListModel.fromMap(response.data);
      Madpoly.print(
        'response = ',
        color: MadpolyColor.green,
        inspectObject: listModel,
        tag: 'weekly_sessions_repo > getAllItems',
        developer: "Ziad",
      );
      _alertHandlingRepository.addError(
        'data retrieved successfully',
        AlertHandlingTypes.Alert,
        tag: 'weekly_sessions_repo > getAllItems',
        // showToast: true,
      );
      // }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekly_sessions_repo > getAllItems',
        showToast: true,
      );
    }
    return listModel;
  }

  Future<bool> addItem(
      {required WeeklySessionModel model, bool addWithId = false}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _weeklySessionsNetwork.addItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Added Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weekly_sessions_repo > addItem',
          showToast: true,
        );
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekly_sessions_repo > addItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  Future<bool> updateItem({required WeeklySessionModel model}) async {
    bool requestSuccess = false;
    try {
      bool successfulRequest =
          await _weeklySessionsNetwork.updateItem(model: model);
      if (successfulRequest) {
        _alertHandlingRepository.addError(
          'Data Updated Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weekly_sessions_repo > updateItem',
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
        tag: 'weekly_sessions_repo > updateItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  Future<bool> deleteItem({required WeeklySessionModel model}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess =
          await _weeklySessionsNetwork.deleteItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Deleted Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weekly_sessions_repo > delete',
          showToast: true,
        );
      } else {
        throw Exception('unable to delete item');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekly_sessions_repo > delete',
        showToast: true,
      );
    }
    return requestSuccess;
  }
}
