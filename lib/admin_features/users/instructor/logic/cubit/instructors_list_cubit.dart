import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/ischooler_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/logic/cubit/ischooler_list_cubit.dart';
import '../../data/models/instructors_list_model.dart';
import '../../../../dashboard/data/repo/dashboard_repo.dart';

part 'instructors_list_state.dart';

class InstructorsListCubit extends IschoolerListCubit<InstructorsListState> {
  final DashboardRepository _instructorRepository;
  final LoadingRepository _loadingRepository;

  InstructorsListCubit(
    DashboardRepository instructorRepository,
    LoadingRepository loadingRepository,
  )   : _instructorRepository = instructorRepository,
        _loadingRepository = loadingRepository,
        super(InstructorsListState.init());

  @override
  Future<void> getAllItems({Map<String, dynamic>? eqMap}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    IschoolerListModel response =
        //model is sent here to get the type of request only
        await _instructorRepository.getAllItems(
            model: InstructorsListModel.empty());
    if (response is InstructorsListModel) {
      emit(state.updateData(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'instructors_list_cubit > ',
        showToast: true,
        developer: "Ziad",
      );
    }
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> addItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _instructorRepository.addItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest =
        await _instructorRepository.updateItem(model: model);
    if (successfulRequest) {
      emit(state.updateStatus());
      await getAllItems();
    } // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _instructorRepository.deleteItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
  }
}
