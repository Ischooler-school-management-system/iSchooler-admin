part of 'grades_list_cubit.dart';

// @immutable

class GradesListState extends IschoolerListState {
  const GradesListState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory GradesListState.init() {
    return GradesListState(
      ischoolerAllModel: GradesListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  GradesListState updateData(IschoolerListModel newData) {
    return _copyWith(
      ischoolerAllModel: newData is GradesListModel ? newData : null,
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
    GradesListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return GradesListState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
