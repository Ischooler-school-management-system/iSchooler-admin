part of 'classes_list_cubit.dart';

// @immutable

class ClassListState extends EduconnectState {
  const ClassListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory ClassListState.init() {
    return ClassListState(
      educonnectAllModel: ClassesListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  ClassListState updateAllClasses(ClassesListModel classsListModel) {
    return _copyWith(
      educonnectAllModel: classsListModel,
      status: EduconnectStatus.loaded,
    );
  }

  ClassListState _copyWith({
    ClassesListModel? educonnectAllModel,
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
