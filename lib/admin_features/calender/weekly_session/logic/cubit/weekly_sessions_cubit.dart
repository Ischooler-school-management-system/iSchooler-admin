import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ischooler_admin/admin_features/calender/weekly_timetable_day/data/models/weekly_timetable_day_model.dart';

import '../../../../../common/common_features/loading/data/models/loading_model.dart';
import '../../../../../common/common_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/ischooler_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/logic/cubit/ischooler_list_cubit.dart';
import '../../../weekly_timetable_day/data/repo/weekly_timetable_day_repo.dart';
import '../../data/models/weekly_session_model.dart';
import '../../data/models/weekly_sessions_list_model.dart';
import '../../data/repo/weekly_session_repo.dart';

part 'weekly_sessions_state.dart';

class WeeklySessionsCubit extends Cubit<WeeklySessionsState> {
  final WeeklySessionsRepository _weeklySessionsRepository;
  final WeeklyTimetableDaysRepository _weeklyTimetableDaysRepository;
  final LoadingRepository _loadingRepository;

  WeeklySessionsCubit(
    WeeklySessionsRepository weeklySessionsRepository,
    WeeklyTimetableDaysRepository weeklyTimetableDaysRepository,
    LoadingRepository loadingRepository,
  )   : _weeklySessionsRepository = weeklySessionsRepository,
        _weeklyTimetableDaysRepository = weeklyTimetableDaysRepository,
        _loadingRepository = loadingRepository,
        super(WeeklySessionsState.init());

  Future<void> getAllItems({
    required WeeklyTimetableDayModel weeklyTimetableDayModel,
  }) async {
    _loadingRepository.startLoading(LoadingType.normal);
    IschoolerListModel response =
        //model is sent here to get the type of request only
        await _weeklySessionsRepository.getAllItems(
            weeklyTimetableDayModel: weeklyTimetableDayModel);
    if (response is WeeklySessionsListModel) {
      emit(state.updateData(response));
    } else {
      Madpoly.print(
        'incorrect model >> ${response.runtimeType}',
        tag: 'weeklyTimetables_list_cubit > ',
        showToast: true,
        developer: "Ziad",
      );
    }
    _loadingRepository.stopLoading();
  }

  Future<void> addItem({
    required WeeklySessionModel weeklySessionModel,
    // required String timetableId,
  }) async {
    _loadingRepository.startLoading(LoadingType.normal);
    // get the weeklyTimetableDay with theses classId & weekdayId
    WeeklyTimetableDayModel newWeeklyTimetableDay =
        await _weeklyTimetableDaysRepository.getItem(
            model: weeklySessionModel.weeklyTimetableDay);

    //if not found create a new day
    if (newWeeklyTimetableDay == WeeklyTimetableDayModel.empty()) {
      newWeeklyTimetableDay = await _weeklyTimetableDaysRepository.addItem(
          model: weeklySessionModel.weeklyTimetableDay);
    }
    // use that weeklyTimetableDay id to add the session
    if (newWeeklyTimetableDay != WeeklyTimetableDayModel.empty()) {
      await _weeklySessionsRepository.addItem(
          model: weeklySessionModel.copyWith(
              weeklyTimetableDay: newWeeklyTimetableDay));
      emit(state.updateStatus());
      await getAllItems(weeklyTimetableDayModel: newWeeklyTimetableDay);
    }
    // _loadingRepository.stopLoading();
  }

  Future<void> updateItem({
    required WeeklySessionModel weeklySessionModel,
  }) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest =
        await _weeklySessionsRepository.updateItem(model: weeklySessionModel);
    if (successfulRequest) {
      emit(state.updateStatus());
      await getAllItems(
          weeklyTimetableDayModel: weeklySessionModel.weeklyTimetableDay);
    } // _loadingRepository.stopLoading();
  }

  Future<void> deleteItem({
    required WeeklySessionModel weeklySessionModel,
  }) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _weeklySessionsRepository.deleteItem(model: weeklySessionModel);
    emit(state.updateStatus());
    await getAllItems(
        weeklyTimetableDayModel: weeklySessionModel.weeklyTimetableDay);
  }
}
