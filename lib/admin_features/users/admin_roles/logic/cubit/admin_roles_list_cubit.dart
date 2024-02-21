import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/data/repo/dashboard_repo.dart';
import '../../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../data/models/admin_roles_list_model.dart';

part 'admin_roles_list_state.dart';

class AdminRolesListCubit extends EduconnectCubit<AdminRolesListState> {
  final DashboardRepository _dashboardRepository;
  final LoadingRepository _loadingRepository;

  AdminRolesListCubit(
    DashboardRepository dashboardRepository,
    LoadingRepository loadingRepository,
  )   : _dashboardRepository = dashboardRepository,
        _loadingRepository = loadingRepository,
        super(AdminRolesListState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectListModel response =
        //model is sent here to get the type of request only
        await _dashboardRepository.getAllItems(
            model: AdminRolesListModel.empty());
    if (response is AdminRolesListModel) {
      emit(state.updateData(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'admin_roles_list_cubit > ',
        showToast: true,
        developer: "Ziad",
      );
    }
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> addItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _dashboardRepository.addItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest =
        await _dashboardRepository.updateItem(model: model);
    if (successfulRequest) {
      emit(state.updateStatus());
      await getAllItems();
    } // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _dashboardRepository.deleteItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
  }
}
