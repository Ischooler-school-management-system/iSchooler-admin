part of 'weekday_cubit.dart';

// @immutable

class WeekdaysState extends EduconnectState {
  const WeekdaysState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory WeekdaysState.init() {
    return WeekdaysState(
      educonnectAllModel: WeekdaysListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  @override
  WeekdaysState updateData(EduconnectListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is WeekdaysListModel ? newData : null,
      status: EduconnectStatus.loaded,
    );
  }

  @override
  WeekdaysState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
    );
  }

  WeekdaysState _copyWith({
    WeekdaysListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return WeekdaysState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
