import '../../../../../../common/common_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../../../../common/common_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../../../../common/madpoly.dart';
import '../../../../../../common/network/educonnect_response.dart';
import '../models/weekly_timetable_model.dart';
import '../models/weekly_timetables_list_model.dart';
import '../network/weekly_timetable_network.dart';

class WeeklyTimetableRepository {
  final AlertHandlingRepository _alertHandlingRepository;
  final WeeklyTimetableNetwork _adminNetwork;

  WeeklyTimetableRepository(AlertHandlingRepository alertHandlingRepository,
      WeeklyTimetableNetwork adminNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminNetwork = adminNetwork;

  Future<WeeklyTimetablesListModel> getAllItems(
      {required WeeklyTimetablesListModel model}) async {
    WeeklyTimetablesListModel listModel = WeeklyTimetablesListModel.empty();
    Madpoly.print(
      ' model >> ${model.runtimeType}',
      inspectObject: model,
      tag: 'repo > getAllItems ',
      developer: "Ziad",
      // showToast: true,
    );
    try {
      IschoolerResponse response =
          await _adminNetwork.getAllItems(model: model);
      // if (response.hasData) {

      listModel = WeeklyTimetablesListModel.fromMap(response.data);
      Madpoly.print(
        'response = ',
        color: MadpolyColor.green,
        inspectObject: listModel,
        tag: 'weeklytimetable_repo > getAllItems',
        developer: "Ziad",
      );
      _alertHandlingRepository.addError(
        'data retrieved sucessfully',
        AlertHandlingTypes.Alert,
        tag: 'weeklytimetable_repo > getAllItems',
        // showToast: true,
      );
      // }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weeklytimetable_repo > getAllItems',
        showToast: true,
      );
    }
    return listModel;
  }

  Future<WeeklyTimetableModel> getItemByClassId(
      {required String classId}) async {
    WeeklyTimetableModel weeklyTimetableData = WeeklyTimetableModel.empty();
    Madpoly.print(
      ' classId >> $classId',
      inspectObject: classId,
      tag: 'repo > getAllItems ',
      developer: "Ziad",
      // showToast: true,
    );
    try {
      IschoolerResponse response =
          await _adminNetwork.getItemByClassId(classId: classId);
      // if (response.hasData) {

      weeklyTimetableData = WeeklyTimetableModel.fromMap(response.data);
      Madpoly.print(
        'response = ',
        color: MadpolyColor.green,
        inspectObject: weeklyTimetableData,
        tag: 'weeklytimetable_repo > getAllItems',
        developer: "Ziad",
      );
      _alertHandlingRepository.addError(
        'data retrieved sucessfully',
        AlertHandlingTypes.Alert,
        tag: 'weeklytimetable_repo > getAllItems',
        // showToast: true,
      );
      // }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weeklytimetable_repo > getAllItems',
        showToast: true,
      );
    }
    return weeklyTimetableData;
  }

  Future<bool> addItem(
      {required WeeklyTimetableModel model, bool addWithId = false}) async {
    bool requestSuccess = false;
    try {
      requestSuccess = await _adminNetwork.addItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Added Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weeklytimetable_repo > addItem',
          showToast: true,
        );
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weeklytimetable_repo > addItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  Future<bool> updateItem({required WeeklyTimetableModel model}) async {
    bool requestSuccess = false;
    try {
      bool successfulRequest = await _adminNetwork.updateItem(model: model);
      if (successfulRequest) {
        _alertHandlingRepository.addError(
          'Data Updated Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weeklytimetable_repo > updateItem',
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
        tag: 'weeklytimetable_repo > updateItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  Future<bool> deleteItem({required WeeklyTimetableModel model}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.deleteItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Deleted Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weeklytimetable_repo > delete',
          showToast: true,
        );
      } else {
        throw Exception('unable to delete item');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weeklytimetable_repo > delete',
        showToast: true,
      );
    }
    return requestSuccess;
  }
}
