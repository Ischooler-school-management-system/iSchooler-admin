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

  GradesListState updateAllGrades(GradesListModel gradesListModel) {
    return _copyWith(
      educonnectAllModel: gradesListModel,
      status: EduconnectStatus.loaded,
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
