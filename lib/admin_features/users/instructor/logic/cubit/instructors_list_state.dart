part of 'instructors_list_cubit.dart';

// @immutable

class InstructorsListState extends IschoolerListState {
  const InstructorsListState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory InstructorsListState.init() {
    return InstructorsListState(
      ischoolerAllModel: InstructorsListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  InstructorsListState updateData(newData) {
    return _copyWith(
      ischoolerAllModel: newData is InstructorsListModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  InstructorsListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  InstructorsListState _copyWith({
    InstructorsListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return InstructorsListState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
