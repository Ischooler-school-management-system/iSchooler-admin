import '../../../../../common/common_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../../../common/common_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../../../common/madpoly.dart';
import '../../../../../common/network/ischooler_response.dart';
import '../models/weekly_timetable_day_model.dart';
import '../network/weekly_timetable_day_network.dart';

class WeeklyTimetableDaysRepository {
  final AlertHandlingRepository _alertHandlingRepository;
  final WeeklyTimetableDayNetwork _adminNetwork;

  WeeklyTimetableDaysRepository(AlertHandlingRepository alertHandlingRepository,
      WeeklyTimetableDayNetwork adminNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminNetwork = adminNetwork;

  Future<WeeklyTimetableDayModel> addItem(
      {required WeeklyTimetableDayModel model}) async {
    WeeklyTimetableDayModel weeklyTimetableData =
        WeeklyTimetableDayModel.empty();

    try {
      IschoolerResponse response = await _adminNetwork.addItem(model: model);
      weeklyTimetableData = WeeklyTimetableDayModel.fromMap(response.data);
      Madpoly.print(
        'response = ',
        color: MadpolyColor.green,
        inspectObject: weeklyTimetableData,
        tag: 'WeeklyTimetableDay_repo > getAllItems',
        developer: "Ziad",
      );
      _alertHandlingRepository.addError(
        'data retrieved successfully',
        AlertHandlingTypes.Alert,
        tag: 'WeeklyTimetableDay_repo > getAllItems',
        // showToast: true,
      );
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekly_timetable_days_repo > addItem',
        showToast: true,
      );
    }
    return weeklyTimetableData;
  }

  Future<WeeklyTimetableDayModel> getItem(
      {required WeeklyTimetableDayModel model}) async {
    WeeklyTimetableDayModel weeklyTimetableData =
        WeeklyTimetableDayModel.empty();
    Madpoly.print(
      ' model ',
      inspectObject: model,
      tag: 'repo > getAllItems ',
      developer: "Ziad",
      // showToast: true,
    );
    try {
      IschoolerResponse response = await _adminNetwork.getItem(model: model);
      // if (response.hasData) {

      weeklyTimetableData = WeeklyTimetableDayModel.fromMap(response.data);
      Madpoly.print(
        'response = ',
        color: MadpolyColor.green,
        inspectObject: weeklyTimetableData,
        tag: 'WeeklyTimetableDay_repo > getAllItems',
        developer: "Ziad",
      );
      _alertHandlingRepository.addError(
        'data retrieved successfully',
        AlertHandlingTypes.Alert,
        tag: 'WeeklyTimetableDay_repo > getAllItems',
        // showToast: true,
      );
      // }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'WeeklyTimetableDay_repo > getAllItems',
        showToast: true,
      );
    }
    return weeklyTimetableData;
  }

  Future<bool> updateItem({required WeeklyTimetableDayModel model}) async {
    bool requestSuccess = false;
    try {
      bool successfulRequest = await _adminNetwork.updateItem(model: model);
      if (successfulRequest) {
        _alertHandlingRepository.addError(
          'Data Updated Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weekly_timetable_days_repo > updateItem',
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
        tag: 'weekly_timetable_days_repo > updateItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  Future<bool> deleteItem({required WeeklyTimetableDayModel model}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.deleteItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Deleted Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weekly_timetable_days_repo > delete',
          showToast: true,
        );
      } else {
        throw Exception('unable to delete item');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekly_timetable_days_repo > delete',
        showToast: true,
      );
    }
    return requestSuccess;
  }
}
