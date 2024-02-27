part of 'weekly_timetable_cubit.dart';

// @immutable

class WeeklyTimetableState {
  final WeeklyTimetableModel weeklyTimetableModel;
  final IschoolerStatus status;
  const WeeklyTimetableState({
    required this.weeklyTimetableModel,
    required this.status,
  });

  factory WeeklyTimetableState.init() {
    return WeeklyTimetableState(
      weeklyTimetableModel: WeeklyTimetableModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  WeeklyTimetableState updateData(WeeklyTimetableModel newData) {
    return _copyWith(
      weeklyTimetableModel: newData,
      status: IschoolerStatus.loaded,
    );
  }

  WeeklyTimetableState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  WeeklyTimetableState _copyWith({
    WeeklyTimetableModel? weeklyTimetableModel,
    IschoolerStatus? status,
  }) {
    return WeeklyTimetableState(
      weeklyTimetableModel: weeklyTimetableModel ?? this.weeklyTimetableModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == IschoolerStatus.loaded;
  List<Object> get props => [weeklyTimetableModel, status];
}
