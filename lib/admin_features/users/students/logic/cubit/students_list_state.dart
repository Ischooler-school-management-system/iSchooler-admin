part of 'students_list_cubit.dart';

// @immutable

class StudentsListState extends IschoolerListState {
  const StudentsListState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory StudentsListState.init() {
    return StudentsListState(
      ischoolerAllModel: IschoolerListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  StudentsListState updateData(IschoolerListModel newData) {
    return _copyWith(
      // ischoolerAllModel: newData is AdminsListModel ? newData : null,
      ischoolerAllModel: newData is StudentsListModel ? newData : null,
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
    IschoolerListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return StudentsListState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
