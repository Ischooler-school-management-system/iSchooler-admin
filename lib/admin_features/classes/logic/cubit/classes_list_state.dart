part of 'classes_list_cubit.dart';

// @immutable

class ClassListState extends IschoolerListState {
  const ClassListState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory ClassListState.init() {
    return ClassListState(
      ischoolerAllModel: ClassesListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  ClassListState updateAllClasses(ClassesListModel classsListModel) {
    return _copyWith(
      ischoolerAllModel: classsListModel,
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
    ClassesListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return ClassListState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
