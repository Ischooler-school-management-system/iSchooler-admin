part of 'weekly_sessions_cubit.dart';

// @immutable

class WeeklySessionsListState extends EduconnectState {
  const WeeklySessionsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory WeeklySessionsListState.init() {
    return WeeklySessionsListState(
      educonnectAllModel: WeeklySessionsListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  @override
  WeeklySessionsListState updateData(EduconnectListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is WeeklySessionsListModel ? newData : null,
      status: EduconnectStatus.loaded,
    );
  }

  @override
  WeeklySessionsListState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
    );
  }

  WeeklySessionsListState _copyWith({
    WeeklySessionsListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return WeeklySessionsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
