part of 'grades_list_cubit.dart';

// @immutable

class GradesListState extends IschoolerListState {
  const GradesListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory GradesListState.init() {
    return GradesListState(
      educonnectAllModel: GradesListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  GradesListState updateData(IschoolerListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is GradesListModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  GradesListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  GradesListState _copyWith({
    GradesListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return GradesListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
