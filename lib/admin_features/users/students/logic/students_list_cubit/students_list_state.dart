part of 'students_list_cubit.dart';

// @immutable

class StudentsListState extends EduconnectState {
  const StudentsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory StudentsListState.init() {
    return StudentsListState(
      educonnectAllModel: EduconnectModelList.empty(),
      status: EduconnectStatus.init,
    );
  }

  StudentsListState updateAllStudents(EduconnectModelList educonnectModel) {
    return _copyWith(
      educonnectAllModel: educonnectModel as StudentsListModel,
      status: EduconnectStatus.loaded,
    );
  }

  StudentsListState _copyWith({
    EduconnectModelList? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return StudentsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
