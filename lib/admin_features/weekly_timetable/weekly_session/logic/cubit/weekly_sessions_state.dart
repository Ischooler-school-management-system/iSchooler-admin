part of 'weekly_sessions_cubit.dart';

// @immutable

class WeeklySessionsState extends EduconnectState {
  const WeeklySessionsState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory WeeklySessionsState.init() {
    return WeeklySessionsState(
      educonnectAllModel: WeeklySessionsListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  @override
  WeeklySessionsState updateData(EduconnectListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is WeeklySessionsListModel ? newData : null,
      status: EduconnectStatus.loaded,
    );
  }

  @override
  WeeklySessionsState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
    );
  }

  WeeklySessionsState _copyWith({
    WeeklySessionsListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return WeeklySessionsState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
