part of 'homeworks_list_cubit.dart';

// @immutable

class HomeworksListState extends IschoolerListState {
  const HomeworksListState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory HomeworksListState.init() {
    return HomeworksListState(
      ischoolerAllModel: HomeworksListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  HomeworksListState updateData(IschoolerListModel newData) {
    return _copyWith(
      ischoolerAllModel: newData is HomeworksListModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  HomeworksListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  HomeworksListState _copyWith({
    HomeworksListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return HomeworksListState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
