part of 'weekday_cubit.dart';

// @immutable

class WeekdaysState extends IschoolerListState {
  const WeekdaysState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory WeekdaysState.init() {
    return WeekdaysState(
      educonnectAllModel: WeekdaysListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  WeekdaysState updateData(IschoolerListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is WeekdaysListModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  WeekdaysState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  WeekdaysState _copyWith({
    WeekdaysListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return WeekdaysState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
