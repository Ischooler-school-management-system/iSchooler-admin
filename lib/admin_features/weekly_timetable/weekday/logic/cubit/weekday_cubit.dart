import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../data/models/weekday_model.dart';
import '../../data/models/weekdays_list_model.dart';
import '../../data/repo/weekday_repo.dart';

part 'weekday_state.dart';

class WeekdaysCubit extends IschoolerCubit<WeekdaysState> {
  final WeekdaysRepository _weekdaysRepository;
  final LoadingRepository _loadingRepository;

  WeekdaysCubit(
    WeekdaysRepository weekdaysRepository,
    LoadingRepository loadingRepository,
  )   : _weekdaysRepository = weekdaysRepository,
        _loadingRepository = loadingRepository,
        super(WeekdaysState.init());

  @override
  Future<void> getAllItems() async {
    _loadingRepository.startLoading(LoadingType.normal);
    IschoolerListModel response =
        //model is sent here to get the type of request only
        await _weekdaysRepository.getAllItems(
            model: WeekdaysListModel.empty(), orderBy: 'id');
    if (response is WeekdaysListModel) {
      emit(state.updateData(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'weeklytimetables_list_cubit > ',
        showToast: true,
        developer: "Ziad",
      );
    }
    _loadingRepository.stopLoading();
  }

  @override
  Future<void> addItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    if (model is WeekdayModel) {
      await _weekdaysRepository.addItem(model: model);
    }
    emit(state.updateStatus());
    await getAllItems();
    // _loadingRepository.stopLoading();
  }

  @override
  Future<void> updateItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    bool successfulRequest = false;
    if (model is WeekdayModel) {
      successfulRequest = await _weekdaysRepository.updateItem(model: model);
    }
    if (successfulRequest) {
      emit(state.updateStatus());
      await getAllItems();
    } // _loadingRepository.stopLoading();
  }

  @override
  Future<void> deleteItem({required IschoolerModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    if (model is WeekdayModel) {
      await _weekdaysRepository.deleteItem(model: model);
    }
    emit(state.updateStatus());
    await getAllItems();
  }
}
