part of 'subjects_list_cubit.dart';

// @immutable

class SubjectsListState extends IschoolerListState {
  const SubjectsListState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory SubjectsListState.init() {
    return SubjectsListState(
      ischoolerAllModel: SubjectsListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  SubjectsListState updateData(IschoolerListModel newData) {
    return _copyWith(
      ischoolerAllModel: newData is SubjectsListModel ? newData : null,
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
    SubjectsListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return SubjectsListState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
