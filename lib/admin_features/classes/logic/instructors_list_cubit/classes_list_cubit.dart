import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../dashboard/data/repo/dashboard_repo.dart';
import '../../../dashboard/logic/cubit/all_cubit.dart';
import '../../data/models/classes_list_model.dart';

part 'classes_list_state.dart';

class ClassesListCubit extends EduconnectCubit {
  final DashboardRepository _classRepository;
  final LoadingRepository _loadingRepository;

  ClassesListCubit(
    DashboardRepository classRepository,
    LoadingRepository loadingRepository,
  )   : _classRepository = classRepository,
        _loadingRepository = loadingRepository,
        super(ClassListState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectModelList response =
        //model is sent here to get the type of request only
        await _classRepository.getAllItems(model: ClassesListModel.empty());
    if (state is ClassListState && response is ClassesListModel) {
      emit((state as ClassListState).updateAllClasses(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'classes_list_cubit > ',
        showToast: true,
        developer: "Ziad",
      );
    }
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> addItem(
      {required EduconnectModel model, bool isEditing = false}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _classRepository.addItem(model: model, addWithId: isEditing);
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _classRepository.deleteItem(model: model);
    await getAllItems();
  }
}
