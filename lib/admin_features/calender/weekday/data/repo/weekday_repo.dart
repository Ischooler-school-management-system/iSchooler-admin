import '../../../../../common/common_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../../../common/common_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../../../common/madpoly.dart';
import '../../../../../common/network/educonnect_response.dart';
import '../models/weekday_model.dart';
import '../models/weekdays_list_model.dart';
import '../network/weekday_network.dart';

class WeekdaysRepository {
  final AlertHandlingRepository _alertHandlingRepository;
  final WeekdaysNetwork _adminNetwork;

  WeekdaysRepository(AlertHandlingRepository alertHandlingRepository,
      WeekdaysNetwork adminNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminNetwork = adminNetwork;

  Future<WeekdaysListModel> getAllItems(
      {required WeekdaysListModel model, String? orderBy}) async {
    WeekdaysListModel listModel = WeekdaysListModel.empty();
    Madpoly.print(
      ' model >> ${model.runtimeType}',
      inspectObject: model,
      tag: 'repo > getAllItems ',
      developer: "Ziad",
      // showToast: true,
    );
    try {
      IschoolerResponse response =
          await _adminNetwork.getAllItems(model: model, orderBy: orderBy);
      // if (response.hasData) {

      listModel = WeekdaysListModel.fromMap(response.data);
      Madpoly.print(
        'response = ',
        color: MadpolyColor.green,
        inspectObject: listModel,
        tag: 'weekdays_repo > getAllItems',
        developer: "Ziad",
      );
      _alertHandlingRepository.addError(
        'data retrieved sucessfully',
        AlertHandlingTypes.Alert,
        tag: 'weekdays_repo > getAllItems',
        // showToast: true,
      );
      // }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekdays_repo > getAllItems',
        showToast: true,
      );
    }
    return listModel;
  }

  Future<bool> addItem(
      {required WeekdayModel model, bool addWithId = false}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.addItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Added Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weekdays_repo > addItem',
          showToast: true,
        );
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekdays_repo > addItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  Future<bool> updateItem({required WeekdayModel model}) async {
    bool requestSuccess = false;
    try {
      bool successfulRequest = await _adminNetwork.updateItem(model: model);
      if (successfulRequest) {
        _alertHandlingRepository.addError(
          'Data Updated Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weekdays_repo > updateItem',
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
        tag: 'weekdays_repo > updateItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  Future<bool> deleteItem({required WeekdayModel model}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.deleteItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Deleted Successfully',
          AlertHandlingTypes.Alert,
          tag: 'weekdays_repo > delete',
          showToast: true,
        );
      } else {
        throw Exception('unable to delete item');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekdays_repo > delete',
        showToast: true,
      );
    }
    return requestSuccess;
  }
}
