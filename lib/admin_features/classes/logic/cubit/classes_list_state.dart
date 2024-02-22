part of 'classes_list_cubit.dart';

// @immutable

class ClassListState extends IschoolerState {
  const ClassListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory ClassListState.init() {
    return ClassListState(
      educonnectAllModel: ClassesListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  ClassListState updateAllClasses(ClassesListModel classsListModel) {
    return _copyWith(
      educonnectAllModel: classsListModel,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  ClassListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  ClassListState _copyWith({
    ClassesListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return ClassListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
