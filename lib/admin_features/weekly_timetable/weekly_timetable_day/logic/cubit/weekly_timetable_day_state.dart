part of 'weekly_timetable_day_cubit.dart';

// @immutable

class WeeklyTimetableDaysListState {
  final WeeklyTimetableDayModel weeklyTimetableDayModel;
  final EduconnectStatus status;
  const WeeklyTimetableDaysListState({
    required this.weeklyTimetableDayModel,
    required this.status,
  });

  factory WeeklyTimetableDaysListState.init() {
    return WeeklyTimetableDaysListState(
      weeklyTimetableDayModel: WeeklyTimetableDayModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  WeeklyTimetableDaysListState updateData(WeeklyTimetableDayModel newData) {
    return _copyWith(
      weeklyTimetableDayModel: newData,
      status: EduconnectStatus.loaded,
    );
  }

  WeeklyTimetableDaysListState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
    );
  }

  WeeklyTimetableDaysListState _copyWith({
    WeeklyTimetableDayModel? weeklyTimetableDayModel,
    EduconnectStatus? status,
  }) {
    return WeeklyTimetableDaysListState(
      weeklyTimetableDayModel:
          weeklyTimetableDayModel ?? this.weeklyTimetableDayModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == EduconnectStatus.loaded;
  List<Object> get props => [weeklyTimetableDayModel, status];
}
