part of 'students_list_cubit.dart';

// @immutable

class StudentsListState extends IschoolerState {
  const StudentsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory StudentsListState.init() {
    return StudentsListState(
      educonnectAllModel: IschoolerListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  StudentsListState updateData(IschoolerListModel newData) {
    return _copyWith(
      // educonnectAllModel: newData is AdminsListModel ? newData : null,
      educonnectAllModel: newData is StudentsListModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  StudentsListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  StudentsListState _copyWith({
    IschoolerListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return StudentsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
