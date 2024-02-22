part of 'subjects_list_cubit.dart';

// @immutable

class SubjectsListState extends IschoolerState {
  const SubjectsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory SubjectsListState.init() {
    return SubjectsListState(
      educonnectAllModel: SubjectsListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  SubjectsListState updateData(IschoolerListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is SubjectsListModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  SubjectsListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  SubjectsListState _copyWith({
    SubjectsListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return SubjectsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
