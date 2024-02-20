part of 'weekly_timetable_cubit.dart';

// @immutable

class WeeklyTimetableState {
  final WeeklyTimetableModel weeklyTimetableModel;
  final EduconnectStatus status;
  const WeeklyTimetableState({
    required this.weeklyTimetableModel,
    required this.status,
  });

  factory WeeklyTimetableState.init() {
    return WeeklyTimetableState(
      weeklyTimetableModel: WeeklyTimetableModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  WeeklyTimetableState updateData(WeeklyTimetableModel newData) {
    return _copyWith(
      weeklyTimetableModel: newData,
      status: EduconnectStatus.loaded,
    );
  }

  WeeklyTimetableState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
    );
  }

  WeeklyTimetableState _copyWith({
    WeeklyTimetableModel? weeklyTimetableModel,
    EduconnectStatus? status,
  }) {
    return WeeklyTimetableState(
      weeklyTimetableModel: weeklyTimetableModel ?? this.weeklyTimetableModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == EduconnectStatus.loaded;
  List<Object> get props => [weeklyTimetableModel, status];
}
