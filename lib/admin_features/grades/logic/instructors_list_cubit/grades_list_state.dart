part of 'grades_list_cubit.dart';

// @immutable

class ClassListState extends EduconnectState {
  const ClassListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory ClassListState.init() {
    return ClassListState(
      educonnectAllModel: GradesListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  ClassListState updateAllGrades(GradesListModel classsListModel) {
    return _copyWith(
      educonnectAllModel: classsListModel,
      status: EduconnectStatus.loaded,
    );
  }

  ClassListState _copyWith({
    GradesListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return ClassListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
