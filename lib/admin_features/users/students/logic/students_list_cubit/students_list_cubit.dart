import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../../../dashboard/data/repo/dashboard_repo.dart';
import '../../data/models/students_list_model.dart';

part 'students_list_state.dart';

class StudentsListCubit extends EduconnectCubit<StudentsListState> {
  final DashboardRepository _studentRepository;
  final LoadingRepository _loadingRepository;

  StudentsListCubit(
    DashboardRepository studentRepository,
    LoadingRepository loadingRepository,
  )   : _studentRepository = studentRepository,
        _loadingRepository = loadingRepository,
        super(StudentsListState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectModelList response =
        //model is sent here to get the type of request only
        await _studentRepository.getAllItems(model: StudentsListModel.empty());
    if (response is StudentsListModel) {
      emit(state.updateAllStudents(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'students_list_cubit > ',
        showToast: true,
        developer: "Ziad",
      );
    }
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> addItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _studentRepository.addItem(model: model);
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    bool successfulRequest = await _studentRepository.updateItem(model: model);
    if (successfulRequest) {
      await getAllItems();
    } // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _studentRepository.deleteItem(model: model);
    await getAllItems();
  }
}
