import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../dashboard/logic/cubit/ischooler_list_cubit.dart';
import '../../data/models/weekly_timetable_day_model.dart';
import '../../data/repo/weekly_timetable_day_repo.dart';

part 'weekly_timetable_day_state.dart';

class WeeklyTimetableDaysCubit extends Cubit<WeeklyTimetableDaysListState> {
  final WeeklyTimetableDaysRepository _weeklyTimetableDaysRepository;
  final LoadingRepository _loadingRepository;

  WeeklyTimetableDaysCubit(
    WeeklyTimetableDaysRepository weeklyTimetableDaysRepository,
    LoadingRepository loadingRepository,
  )   : _weeklyTimetableDaysRepository = weeklyTimetableDaysRepository,
        _loadingRepository = loadingRepository,
        super(WeeklyTimetableDaysListState.init());
// weekly_timetable_day:id | weekly_timetable_id | weekday_id

// weekly_session: id | name | weekly_timetable_day_id | instructor_assignment_id | session_number

  Future<void> addItem({required WeeklyTimetableDayModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _weeklyTimetableDaysRepository.addItem(model: model);
    // emit(state.updateStatus());
    _loadingRepository.stopLoading();
  }

  Future<void> updateItem({required WeeklyTimetableDayModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest =
        await _weeklyTimetableDaysRepository.updateItem(model: model);
    if (successfulRequest) {
      // emit(state.updateStatus());
    }
    _loadingRepository.stopLoading();
  }

  Future<void> deleteItem({required WeeklyTimetableDayModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _weeklyTimetableDaysRepository.deleteItem(model: model);
    // emit(state.updateStatus());
    _loadingRepository.stopLoading();
  }
}
