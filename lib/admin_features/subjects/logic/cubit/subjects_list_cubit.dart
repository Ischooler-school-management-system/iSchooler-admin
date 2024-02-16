import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../dashboard/data/repo/dashboard_repo.dart';
import '../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../data/models/subjects_list_model.dart';

part 'subjects_list_state.dart';

class SubjectsListCubit extends EduconnectCubit<SubjectsListState> {
  final DashboardRepository _subjectRepository;
  final LoadingRepository _loadingRepository;

  SubjectsListCubit(
    DashboardRepository subjectRepository,
    LoadingRepository loadingRepository,
  )   : _subjectRepository = subjectRepository,
        _loadingRepository = loadingRepository,
        super(SubjectsListState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectListModel response =
        //model is sent here to get the type of request only
        await _subjectRepository.getAllItems(model: SubjectsListModel.empty());
    if (response is SubjectsListModel) {
      emit(state.updateData(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'subjects_list_cubit > ',
        showToast: true,
        developer: "Ziad",
      );
    }
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> addItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _subjectRepository.addItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest = await _subjectRepository.updateItem(model: model);
    if (successfulRequest) {
      emit(state.updateStatus());
      await getAllItems();
    }
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _subjectRepository.deleteItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
  }
}
