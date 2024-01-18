import '../../../../../common/comon_features/error_handling/data/models/error_handling_model.dart';
import '../../../../../common/comon_features/error_handling/data/repo/error_handling_repo.dart';
import '../../../../../common/network/educonnect_response.dart';
import '../../../user_model.dart';
import '../models/all_admins_model.dart';
import '../network/user_network.dart';

class AdminRepository {
  final ErrorHandlingRepository _alertHandlingRepository;
  final UserNetwork _adminNetwork;

  AdminRepository(
      ErrorHandlingRepository alertHandlingRepository, UserNetwork adminNetwork)
      : _alertHandlingRepository = alertHandlingRepository,
        _adminNetwork = adminNetwork;

  Future<void> addUser({required UserModel user}) async {
    try {
      bool requestSuccess = await _adminNetwork.addUser(user: user);
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
  }

  Future<AllAdminsModel> getAllAdminsData() async {
    var admins = AllAdminsModel.empty();
    try {
      EduconnectResponse response =
          await _adminNetwork.getAllUsersData(role: UserRole.admin);
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
