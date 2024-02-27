part of 'homeworks_list_cubit.dart';

// @immutable

class HomeworksListState extends IschoolerListState {
  const HomeworksListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory HomeworksListState.init() {
    return HomeworksListState(
      educonnectAllModel: HomeworksListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  HomeworksListState updateData(IschoolerListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is HomeworksListModel ? newData : null,
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
    HomeworksListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return HomeworksListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
