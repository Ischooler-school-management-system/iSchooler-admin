import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/ischooler_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../dashboard/data/repo/dashboard_repo.dart';
import '../../../dashboard/logic/cubit/ischooler_list_cubit.dart';
import '../../data/models/homeworks_list_model.dart';

part 'homeworks_list_state.dart';

class HomeworksListCubit extends IschoolerListCubit<HomeworksListState> {
  final DashboardRepository _homeworkRepository;
  final LoadingRepository _loadingRepository;

  HomeworksListCubit(
    DashboardRepository homeworkRepository,
    LoadingRepository loadingRepository,
  )   : _homeworkRepository = homeworkRepository,
        _loadingRepository = loadingRepository,
        super(HomeworksListState.init());

  @override
  Future<void> getAllItems({Map<String, dynamic>? eqMap}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    IschoolerListModel response =
        //model is sent here to get the type of request only
        await _homeworkRepository.getAllItems(
            model: HomeworksListModel.empty());
    if (response is HomeworksListModel) {
      emit(state.updateData(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'homeworks_list_cubit > ',
        showToast: true,
        developer: "Ziad",
      );
    }
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> addItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _homeworkRepository.addItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest = await _homeworkRepository.updateItem(model: model);
    if (successfulRequest) {
      emit(state.updateStatus());
      await getAllItems();
    }
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _homeworkRepository.deleteItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
  }
}
