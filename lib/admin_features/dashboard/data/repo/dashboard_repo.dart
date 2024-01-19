import '../../../../common/comon_features/error_handling/data/models/error_handling_model.dart';
import '../../../../common/comon_features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../common/educonnect_model.dart';
import '../../../../common/network/educonnect_response.dart';
import '../../logic/cubit/all_cubit.dart';
import '../network/dashboard_network.dart';

class DashboardRepository implements EduconnectRepository {
  final ErrorHandlingRepository _alertHandlingRepository;
  final DashboardNetwork _adminNetwork;

  DashboardRepository(ErrorHandlingRepository alertHandlingRepository,
      DashboardNetwork adminNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminNetwork = adminNetwork;

  @override
  Future<EduconnectAllModel> getAllItems(
      {required EduconnectAllModel model}) async {
    var admins = EduconnectAllModel.empty();
    try {
      EduconnectResponse response =
          await _adminNetwork.getAllItems(model: model);
      if (response.hasData) {
        admins = EduconnectAllModel.fromMap(response.data);
        _alertHandlingRepository.addError(
          'Admins retrieved sucessfully',
          ErrorHandlingTypes.Alert,
          tag: 'admin_repo > getAllAdminsData',
          showToast: true,
        );
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'admin_repo > getAllAdminsData',
        showToast: true,
      );
    }
    return admins;
  }

  @override
  Future<bool> addItem({required EduconnectModel model}) async {
    bool requestSuccess = false;
    try {
      bool requestSuccess = await _adminNetwork.addItem(model: model);
      if (requestSuccess) {
        _alertHandlingRepository.addError(
          'Admin Data Stored Successfully',
          ErrorHandlingTypes.Alert,
          tag: 'admin_repo > storeAdminData',
          showToast: true,
        );
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'admin_repo > storeAdminData',
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
          ErrorHandlingTypes.Alert,
          tag: 'admin_repo > storeAdminData',
          showToast: true,
        );
      } else {
        throw Exception('unable to add user');
      }
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'admin_repo > storeAdminData',
        showToast: true,
      );
    }
    return requestSuccess;
  }
}
