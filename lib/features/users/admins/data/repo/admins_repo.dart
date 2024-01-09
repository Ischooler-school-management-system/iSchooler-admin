import '../../../../../common/features/error_handling/data/models/error_handling_model.dart';
import '../../../../../common/features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../../common/network/educonnect_response.dart';
import '../models/admin_model.dart';
import '../models/all_admins_model.dart';
import '../network/admins_network.dart';

class AdminRepository {
  final ErrorHandlingRepository _alertHandlingRepository;
  final AdminNetwork _adminNetwork;

  AdminRepository(ErrorHandlingRepository alertHandlingRepository,
      AdminNetwork adminNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminNetwork = adminNetwork;

  Future<void> storeAdminData({required AdminModel admin}) async {
    try {
      _adminNetwork.storeAdminData(admin: admin);
      _alertHandlingRepository.addError(
        'Admin Data Stored Successfully',
        ErrorHandlingTypes.Alert,
        tag: 'admin_repo > storeAdminData',
        showToast: true,
      );
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        ErrorHandlingTypes.ServerError,
        tag: 'admin_repo > storeAdminData',
        showToast: true,
      );
    }
  }

  Future<AllAdminsModel> getAllAdminsData() async {
    var admins = AllAdminsModel.empty();
    try {
      EduconnectResponse response = await _adminNetwork.getAllAdminsData();
      if (response.hasData) {
        admins = AllAdminsModel.fromMap(response.data);
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
}
