import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../dashboard/logic/cubit/all_cubit.dart';
import '../../data/models/admin_model.dart';
import '../../data/models/all_admins_model.dart';
import '../../data/repo/admins_repo.dart';

part 'all_admins_state.dart';

class AllAdminsCubit extends EduconnectCubit {
  final AdminRepository _adminRepository;
  final LoadingRepository _loadingRepository;

  AllAdminsCubit(
    AdminRepository adminRepository,
    LoadingRepository loadingRepository,
  )   : _adminRepository = adminRepository,
        _loadingRepository = loadingRepository,
        super(AllAdminsState.init());

  @override
  Future<void> getAllData() async {
    _loadingRepository.startLoading(LoadingType.normal);
    AllAdminsModel response = await _adminRepository.getAllAdminsData();
    emit((state as AllAdminsState).updateAllAdmins(response));
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> add({required EduconnectModel educonnectModel}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _adminRepository.addUser(user: educonnectModel as AdminModel);
    await getAllData();
    // _loadingRepository.stopLoading();
  }
}
