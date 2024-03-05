part of 'weekday_cubit.dart';

// @immutable

class WeekdaysState extends IschoolerListState {
  const WeekdaysState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory WeekdaysState.init() {
    return WeekdaysState(
      ischoolerAllModel: WeekdaysListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  WeekdaysState updateData(IschoolerListModel newData) {
    return _copyWith(
      ischoolerAllModel: newData is WeekdaysListModel ? newData : null,
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
    WeekdaysListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return WeekdaysState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
