part of 'grades_list_cubit.dart';

// @immutable

class GradesListState extends EduconnectState {
  const GradesListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory GradesListState.init() {
    return GradesListState(
      educonnectAllModel: GradesListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  @override
  GradesListState updateData(EduconnectListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is GradesListModel ? newData : null,
      status: EduconnectStatus.loaded,
    );
  }

  @override
  GradesListState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
    );
  }

  GradesListState _copyWith({
    GradesListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return GradesListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
