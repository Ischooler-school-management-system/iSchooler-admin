import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../data/models/weekly_timetable_day_model.dart';
import '../../data/repo/weekly_timetable_day_repo.dart';

part 'weekly_timetable_day_state.dart';

class WeeklyTimetableDaysCubit extends Cubit<WeeklyTimetableDaysListState> {
  final WeeklyTimetableDaysRepository _weeklytimetabledaysRepository;
  final LoadingRepository _loadingRepository;

  WeeklyTimetableDaysCubit(
    WeeklyTimetableDaysRepository weeklytimetabledaysRepository,
    LoadingRepository loadingRepository,
  )   : _weeklytimetabledaysRepository = weeklytimetabledaysRepository,
        _loadingRepository = loadingRepository,
        super(WeeklyTimetableDaysListState.init());

  Future<void> addItem({required WeeklyTimetableDayModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _weeklytimetabledaysRepository.addItem(model: model);
    // emit(state.updateStatus());
    _loadingRepository.stopLoading();
  }

  Future<void> updateItem({required WeeklyTimetableDayModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest =
        await _weeklytimetabledaysRepository.updateItem(model: model);
    if (successfulRequest) {
      // emit(state.updateStatus());
    }
    _loadingRepository.stopLoading();
  }

  Future<void> deleteItem({required WeeklyTimetableDayModel model}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _weeklytimetabledaysRepository.deleteItem(model: model);
    // emit(state.updateStatus());
    _loadingRepository.stopLoading();
  }
}
