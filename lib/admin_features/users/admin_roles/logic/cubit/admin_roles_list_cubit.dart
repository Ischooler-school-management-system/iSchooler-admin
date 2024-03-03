import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/ischooler_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/data/repo/dashboard_repo.dart';
import '../../../../dashboard/logic/cubit/ischooler_list_cubit.dart';
import '../../data/models/admin_roles_list_model.dart';

part 'admin_roles_list_state.dart';

class AdminRolesListCubit extends IschoolerListCubit<AdminRolesListState> {
  final DashboardRepository _dashboardRepository;
  final LoadingRepository _loadingRepository;

  AdminRolesListCubit(
    DashboardRepository dashboardRepository,
    LoadingRepository loadingRepository,
  )   : _dashboardRepository = dashboardRepository,
        _loadingRepository = loadingRepository,
        super(AdminRolesListState.init());

  @override
  Future<void> getAllItems({Map<String, dynamic>? eqMap}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    IschoolerListModel response =
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
  Future<void> addItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _dashboardRepository.addItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest =
        await _dashboardRepository.updateItem(model: model);
    if (successfulRequest) {
      emit(state.updateStatus());
      await getAllItems();
    } // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _dashboardRepository.deleteItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
  }
}
