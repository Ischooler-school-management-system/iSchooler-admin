import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../dashboard/data/repo/dashboard_repo.dart';
import '../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../data/models/grades_list_model.dart';

part 'grades_list_state.dart';

class GradesListCubit extends EduconnectCubit<GradesListState> {
  final DashboardRepository _dashboardRepository;
  final LoadingRepository _loadingRepository;

  GradesListCubit(
    DashboardRepository dashboardRepository,
    LoadingRepository loadingRepository,
  )   : _dashboardRepository = dashboardRepository,
        _loadingRepository = loadingRepository,
        super(GradesListState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectListModel response =
        //model is sent here to get the type of request only
        await _dashboardRepository.getAllItems(model: GradesListModel.empty());
    if (response is GradesListModel) {
      emit(state.updateData(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'grades_list_cubit > ',
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