part of 'instructors_list_cubit.dart';

// @immutable

class InstructorsListState extends IschoolerState {
  const InstructorsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory InstructorsListState.init() {
    return InstructorsListState(
      educonnectAllModel: InstructorsListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  InstructorsListState updateData(newData) {
    return _copyWith(
      educonnectAllModel: newData is InstructorsListModel ? newData : null,
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
    InstructorsListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return InstructorsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
