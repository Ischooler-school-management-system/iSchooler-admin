import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/comon_features/loading/data/models/loading_model.dart';
import '../../../../../common/comon_features/loading/data/repo/loading_repo.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../data/models/weekly_session_model.dart';
import '../../data/models/weekly_sessions_list_model.dart';
import '../../data/repo/weekly_session_repo.dart';

part 'weekly_sessions_state.dart';

class WeeklySessionsCubit extends Cubit<WeeklySessionsListState> {
  final WeeklySessionsRepository _weeklysessionsRepository;
  final LoadingRepository _loadingRepository;

  WeeklySessionsCubit(
    WeeklySessionsRepository weeklysessionsRepository,
    LoadingRepository loadingRepository,
  )   : _weeklysessionsRepository = weeklysessionsRepository,
        _loadingRepository = loadingRepository,
        super(WeeklySessionsListState.init());

  Future<void> getAllItems({
    required String classId,
    required String weekdayId,
  }) async {
    _loadingRepository.startLoading(LoadingType.normal);
    EduconnectListModel response =
        //model is sent here to get the type of request only
        await _weeklysessionsRepository.getAllItems(
      classId: classId,
      weekdayId: weekdayId,
    );
    if (response tingis WeeklySessionsListModel) {
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

  Future<void> addItem({
    required WeeklySessionModel model,
    required String classId,
    required String weekdayId,
  }) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _weeklysessionsRepository.addItem(model: model);
    emit(state.updateStatus());
    await getAllItems(classId: classId, weekdayId: weekdayId);
    // _loadingRepository.stopLoading();
  }

  Future<void> updateItem({
    required WeeklySessionModel model,
    required String classId,
    required String weekdayId,
  }) async {
    _loadingRepository.startLoading(LoadingType.normal);

    bool successfulRequest =
        await _weeklysessionsRepository.updateItem(model: model);
    if (successfulRequest) {
      emit(state.updateStatus());
      await getAllItems(classId: classId, weekdayId: weekdayId);
    } // _loadingRepository.stopLoading();
  }

  Future<void> deleteItem({
    required WeeklySessionModel model,
    required String classId,
    required String weekdayId,
  }) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _weeklysessionsRepository.deleteItem(model: model);
    emit(state.updateStatus());
    await getAllItems(classId: classId, weekdayId: weekdayId);
  }
}
