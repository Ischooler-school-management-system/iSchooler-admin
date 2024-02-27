part of 'weekly_sessions_cubit.dart';

// @immutable

class WeeklySessionsState extends IschoolerListState {
  const WeeklySessionsState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory WeeklySessionsState.init() {
    return WeeklySessionsState(
      educonnectAllModel: WeeklySessionsListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  WeeklySessionsState updateData(IschoolerListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is WeeklySessionsListModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  WeeklySessionsState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  WeeklySessionsState _copyWith({
    WeeklySessionsListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return WeeklySessionsState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
