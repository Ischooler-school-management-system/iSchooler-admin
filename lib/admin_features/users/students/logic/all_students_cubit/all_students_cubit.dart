import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../dashboard/logic/cubit/all_cubit.dart';
import '../../../../dashboard/data/repo/dashboard_repo.dart';
import '../../data/models/all_students_model.dart';

part 'all_students_state.dart';

class AllStudentsCubit extends EduconnectCubit {
  final DashboardRepository _studentRepository;
  final LoadingRepository _loadingRepository;

  AllStudentsCubit(
    DashboardRepository studentRepository,
    LoadingRepository loadingRepository,
  )   : _studentRepository = studentRepository,
        _loadingRepository = loadingRepository,
        super(AllStudentsState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectAllModel response =
        //model is sent here to get the type of request only
        await _studentRepository.getAllItems(model: state.educonnectAllModel);
    emit((state as AllStudentsState).updateAllStudents(response));
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
  Future<void> deleteItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _studentRepository.deleteItem(model: model);
    await getAllItems();
  }
}
