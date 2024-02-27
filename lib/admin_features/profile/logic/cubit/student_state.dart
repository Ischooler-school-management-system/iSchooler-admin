part of 'student_cubit.dart';

// @immutable

class StudentState extends IschoolerState {
  const StudentState({
    required super.ischoolerModel,
    required super.status,
  });

  factory StudentState.init() {
    return StudentState(
      ischoolerModel: IschoolerModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  StudentState updateData(IschoolerModel newData) {
    return _copyWith(
      // ischoolerModel: newData is AdminsListModel ? newData : null,
      ischoolerModel: newData is StudentModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  StudentState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  StudentState _copyWith({
    IschoolerModel? ischoolerModel,
    IschoolerStatus? status,
  }) {
    return StudentState(
      ischoolerModel: ischoolerModel ?? this.ischoolerModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerModel, status];
}
