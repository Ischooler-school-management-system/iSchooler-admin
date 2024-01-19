import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../dashboard/logic/cubit/all_cubit.dart';
import '../../data/models/all_admins_model.dart';
import '../../../../dashboard/data/repo/dashboard_repo.dart';

part 'all_admins_state.dart';

class AllAdminsCubit extends EduconnectCubit {
  final DashboardRepository _adminRepository;
  final LoadingRepository _loadingRepository;

  AllAdminsCubit(
    DashboardRepository adminRepository,
    LoadingRepository loadingRepository,
  )   : _adminRepository = adminRepository,
        _loadingRepository = loadingRepository,
        super(AllAdminsState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectAllModel response =
        //model is sent here to get the type of request only
        await _adminRepository.getAllItems(model: state.educonnectAllModel);
    emit((state as AllAdminsState).updateAllAdmins(response as AllAdminsModel));
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> addItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _adminRepository.addItem(model: model);
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _adminRepository.deleteItem(model: model);
    await getAllItems();
  }
}
