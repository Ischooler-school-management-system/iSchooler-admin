part of 'weekly_sessions_cubit.dart';

// @immutable

class WeeklySessionsState extends IschoolerListState {
  const WeeklySessionsState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory WeeklySessionsState.init() {
    return WeeklySessionsState(
      ischoolerAllModel: WeeklySessionsListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  WeeklySessionsState updateData(IschoolerListModel newData) {
    return _copyWith(
      ischoolerAllModel: newData is WeeklySessionsListModel ? newData : null,
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
    WeeklySessionsListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return WeeklySessionsState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
