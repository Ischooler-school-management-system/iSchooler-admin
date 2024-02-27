import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/logic/cubit/educonnect_list_cubit.dart';
import '../../data/models/admins_list_model.dart';
import '../../../../dashboard/data/repo/dashboard_repo.dart';

part 'admins_list_state.dart';

class AdminsListCubit extends IschoolerListCubit<AdminsListState> {
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
    IschoolerListModel response =
        //model is sent here to get the type of request only
        await _adminRepository.getAllItems(model: AdminsListModel.empty());
    if (response is AdminsListModel) {
      emit(state.updateData(response));
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
  Future<void> addItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _adminRepository.addItem(model: model);
    emit(state.updateStatus());

    emit(state.updateStatus());
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest = await _adminRepository.updateItem(model: model);
    if (successfulRequest) {
      emit(state.updateStatus());
      emit(state.updateStatus());
      await getAllItems();
    }
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _adminRepository.deleteItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
  }
}
