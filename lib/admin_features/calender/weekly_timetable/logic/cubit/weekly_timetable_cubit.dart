import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../../weekly_timetable/data/models/weekly_timetable_model.dart';
import '../../../weekly_timetable/data/repo/weekly_timetable_repo.dart';

part 'weekly_timetable_state.dart';

/* 
//  context.read<WeeklyTimetableCubit>().getByClassId(classId);
 context.read<WeeklyTimetableCubit>().addItem(model);
 context.read<WeeklyTimetableCubit>().updateItem(model);
 context.read<WeeklyTimetableCubit>().deleteItem(model);
 */
class WeeklyTimetableCubit extends Cubit<WeeklyTimetableState> {
  final WeeklyTimetableRepository _dashboardRepository;
  final LoadingRepository _loadingRepository;

  WeeklyTimetableCubit(
    WeeklyTimetableRepository dashboardRepository,
    LoadingRepository loadingRepository,
  )   : _dashboardRepository = dashboardRepository,
        _loadingRepository = loadingRepository,
        super(WeeklyTimetableState.init());

  Future<void> getItemByClassId({required String classId}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    WeeklyTimetableModel response =
        //model is sent here to get the type of request only
        await _dashboardRepository.getItemByClassId(classId: classId);
    emit(state.updateData(response));
    _loadingRepository.stopLoading();
  }

  Future<void> addItem({required WeeklyTimetableModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool result = await _dashboardRepository.addItem(model: model);
    emit(state.updateStatus());
    if (result) {
      getItemByClassId(classId: model.classId);
    }
    _loadingRepository.stopLoading();
  }

  Future<void> updateItem({required WeeklyTimetableModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest =
        await _dashboardRepository.updateItem(model: model);
    if (successfulRequest) {
      emit(state.updateStatus());
      getItemByClassId(classId: model.classId);
    }
    _loadingRepository.stopLoading();
  }

  Future<void> deleteItem({required WeeklyTimetableModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _dashboardRepository.deleteItem(model: model);
    emit(state.updateStatus());

    _loadingRepository.stopLoading();
  }
}
