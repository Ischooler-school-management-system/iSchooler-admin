import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/logic/cubit/all_cubit.dart';
import '../../data/models/admins_list_model.dart';
import '../../../../dashboard/data/repo/dashboard_repo.dart';

part 'admins_list_state.dart';

class AdminsListCubit extends EduconnectCubit {
  final DashboardRepository _adminRepository;
  final LoadingRepository _loadingRepository;

  AdminsListCubit(
    DashboardRepository adminRepository,
    LoadingRepository loadingRepository,
  )   : _adminRepository = adminRepository,
        _loadingRepository = loadingRepository,
        super(AdminsListState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectModelList response =
        //model is sent here to get the type of request only
        await _adminRepository.getAllItems(model: AdminsListModel.empty());
    if (state is AdminsListState && response is AdminsListModel) {
      emit((state as AdminsListState).updateAllAdmins(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'admins_list_cubit > ',
        developer: "Ziad",
        showToast: true,
      );
    }

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
  Future<void> updateItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _adminRepository.updateItem(model: model);
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
