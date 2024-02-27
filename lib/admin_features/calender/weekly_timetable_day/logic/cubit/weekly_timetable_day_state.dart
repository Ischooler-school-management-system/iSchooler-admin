part of 'weekly_timetable_day_cubit.dart';

// @immutable

class WeeklyTimetableDaysListState {
  final WeeklyTimetableDayModel weeklyTimetableDayModel;
  final IschoolerStatus status;
  const WeeklyTimetableDaysListState({
    required this.weeklyTimetableDayModel,
    required this.status,
  });

  factory WeeklyTimetableDaysListState.init() {
    return WeeklyTimetableDaysListState(
      weeklyTimetableDayModel: WeeklyTimetableDayModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  WeeklyTimetableDaysListState updateData(WeeklyTimetableDayModel newData) {
    return _copyWith(
      weeklyTimetableDayModel: newData,
      status: IschoolerStatus.loaded,
    );
  }

  WeeklyTimetableDaysListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  WeeklyTimetableDaysListState _copyWith({
    WeeklyTimetableDayModel? weeklyTimetableDayModel,
    IschoolerStatus? status,
  }) {
    return WeeklyTimetableDaysListState(
      weeklyTimetableDayModel:
          weeklyTimetableDayModel ?? this.weeklyTimetableDayModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == IschoolerStatus.loaded;
  List<Object> get props => [weeklyTimetableDayModel, status];
}
