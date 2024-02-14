part of 'subjects_list_cubit.dart';

// @immutable

class SubjectsListState extends EduconnectState {
  const SubjectsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory SubjectsListState.init() {
    return SubjectsListState(
      educonnectAllModel: SubjectsListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  SubjectsListState updateAllSubjects(SubjectsListModel subjectsListModel) {
    return _copyWith(
      educonnectAllModel: subjectsListModel,
      status: EduconnectStatus.loaded,
    );
  }

  SubjectsListState _copyWith({
    SubjectsListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return SubjectsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
