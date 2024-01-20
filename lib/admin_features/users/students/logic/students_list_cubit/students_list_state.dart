part of 'students_list_cubit.dart';

// @immutable

class AllStudentsState extends EduconnectState {
  const AllStudentsState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory AllStudentsState.init() {
    return AllStudentsState(
      educonnectAllModel: EduconnectModelList.empty(),
      status: EduconnectStatus.init,
    );
  }

  AllStudentsState updateAllStudents(EduconnectModelList educonnectModel) {
    return _copyWith(
      educonnectAllModel: educonnectModel as AllStudentsModel,
      status: EduconnectStatus.loaded,
    );
  }

  AllStudentsState _copyWith({
    EduconnectModelList? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return AllStudentsState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
