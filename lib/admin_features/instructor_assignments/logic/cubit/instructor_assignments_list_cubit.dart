import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../dashboard/data/repo/dashboard_repo.dart';
import '../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../data/models/instructor_assignments_list_model.dart';

part 'instructor_assignments_list_state.dart';

class InstructorAssignmentsListCubit
    extends EduconnectCubit<InstructorAssignmentsListState> {
  final DashboardRepository _instructorassignmentRepository;
  final LoadingRepository _loadingRepository;

  InstructorAssignmentsListCubit(
    DashboardRepository instructorassignmentRepository,
    LoadingRepository loadingRepository,
  )   : _instructorassignmentRepository = instructorassignmentRepository,
        _loadingRepository = loadingRepository,
        super(InstructorAssignmentsListState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectListModel response =
        //model is sent here to get the type of request only
        await _instructorassignmentRepository.getAllItems(
            model: InstructorAssignmentsListModel.empty());
    if (response is InstructorAssignmentsListModel) {
      emit(state.updateAllInstructorAssignments(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'instructorassignments_list_cubit > ',
        showToast: true,
        developer: "Ziad",
      );
    }
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> addItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _instructorassignmentRepository.addItem(model: model);
    emit(state.updateStatus());
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest =
        await _instructorassignmentRepository.updateItem(model: model);
    if (successfulRequest) {
      emit(state.updateStatus());

      emit(state.updateStatus());
      await getAllItems();
    }
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required EduconnectModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _instructorassignmentRepository.deleteItem(model: model);
    emit(state.updateStatus());

    emit(state.updateStatus());
    await getAllItems();
  }
}
