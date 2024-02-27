import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../../dashboard/logic/cubit/educonnect_list_cubit.dart';
import '../../../dashboard/logic/cubit/ischooler_state.dart';
import '../../../users/students/data/models/student_model.dart';
import '../../data/repo/student_repo.dart';

part 'student_state.dart';

class StudentCubit extends IschoolerCubit<StudentState> {
  final StudentRepository _studentRepository;
  final LoadingRepository _loadingRepository;

  StudentCubit(
    StudentRepository studentRepository,
    LoadingRepository loadingRepository,
  )   : _studentRepository = studentRepository,
        _loadingRepository = loadingRepository,
        super(StudentState.init());

  @override
  Future<void> getItem({required String id}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    IschoolerModel response =
        //model is sent here to get the type of request only
        await _studentRepository.getItem(id: id);
    if (response is StudentModel) {
      emit(state.updateData(response));
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
  Future<void> addItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _studentRepository.addItem(model: model);
    emit(state.updateStatus());
    // await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    bool successfulRequest = await _studentRepository.updateItem(model: model);
    if (successfulRequest) {
      emit(state.updateStatus());
      // await getAllItems();
    } // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _studentRepository.deleteItem(model: model);
    emit(state.updateStatus());
    // await getAllItems();
  }
}
