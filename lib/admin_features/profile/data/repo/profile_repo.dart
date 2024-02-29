import '../../../../common/common_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../../common/common_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../../common/ischooler_model.dart';
import '../../../../common/madpoly.dart';
import '../../../../common/network/ischooler_response.dart';
import '../../../dashboard/data/repo/ischooler_repository_interface.dart';
import '../../../users/admins/data/models/admin_model.dart';
import '../network/profile_network.dart';

class ProfileRepository implements IschoolerRepository {
  final AlertHandlingRepository _alertHandlingRepository;
  final ProfileNetwork _adminNetwork;

  ProfileRepository(AlertHandlingRepository alertHandlingRepository,
      ProfileNetwork adminNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminNetwork = adminNetwork;

  @override
  Future<IschoolerModel> getItem({required String id}) async {
    IschoolerModel listModel = IschoolerModel.empty();
    Madpoly.print(
      ' id >> $id',
      tag: 'repo > getAllItems ',
      developer: "Ziad",
      // showToast: true,
    );
    try {
      IschoolerResponse response = await _adminNetwork.getItem(id: id);
      // if (response.hasData) {

      listModel = AdminModel.fromMap(response.data);
      Madpoly.print(
        'response = ',
        color: MadpolyColor.green,
        inspectObject: listModel,
        tag: 'profile_repo > getAllItems',
        developer: "Ziad",
      );
      _alertHandlingRepository.addError(
        'data retrieved successfully',
        AlertHandlingTypes.Alert,
        tag: 'profile_repo > getAllItems',
        // showToast: true,
      );
      // }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'profile_repo > getAllItems',
        showToast: true,
      );
    }
    return listModel;
  }

  @override
  Future<bool> addItem(
      {required IschoolerModel model, bool addWithId = false}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.addItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Added Successfully',
          AlertHandlingTypes.Alert,
          tag: 'profile_repo > addItem',
          showToast: true,
        );
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'profile_repo > addItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  @override
  Future<bool> updateItem({required IschoolerModel model}) async {
    bool requestSuccess = false;
    try {
      bool successfulRequest = await _adminNetwork.updateItem(model: model);
      if (successfulRequest) {
        _alertHandlingRepository.addError(
          'Data Updated Successfully',
          AlertHandlingTypes.Alert,
          tag: 'profile_repo > updateItem',
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
        tag: 'profile_repo > updateItem',
        showToast: true,
      );
    }
    return requestSuccess;
  }

  @override
  Future<bool> deleteItem({required IschoolerModel model}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.deleteItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Data Deleted Successfully',
          AlertHandlingTypes.Alert,
          tag: 'profile_repo > delete',
          showToast: true,
        );
      } else {
        throw Exception('unable to delete item');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'profile_repo > delete',
        showToast: true,
      );
    }
    return requestSuccess;
  }
}
