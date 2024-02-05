import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/logic/cubit/all_cubit.dart';
import '../../data/models/instructors_list_model.dart';
import '../../../../dashboard/data/repo/dashboard_repo.dart';

part 'instructors_list_state.dart';

class InstructorsListCubit extends EduconnectCubit {
  final DashboardRepository _instructorRepository;
  final LoadingRepository _loadingRepository;

  InstructorsListCubit(
    DashboardRepository instructorRepository,
    LoadingRepository loadingRepository,
  )   : _instructorRepository = instructorRepository,
        _loadingRepository = loadingRepository,
        super(InstructorsListState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectModelList response =
        //model is sent here to get the type of request only
        await _instructorRepository.getAllItems(
            model: InstructorsListModel.empty());
    if (state is InstructorsListState && response is InstructorsListModel) {
      emit((state as InstructorsListState).updateAllInstructors(response));
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
  Future<void> addItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _instructorRepository.addItem(model: model);
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest =
        await _instructorRepository.updateItem(model: model);
    if (successfulRequest) {
      await getAllItems();
    } // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _instructorRepository.deleteItem(model: model);
    await getAllItems();
  }
}
