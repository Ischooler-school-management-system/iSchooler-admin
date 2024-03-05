part of 'instructor_assignments_list_cubit.dart';

// @immutable

class InstructorAssignmentsListState extends IschoolerListState {
  const InstructorAssignmentsListState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory InstructorAssignmentsListState.init() {
    return InstructorAssignmentsListState(
      ischoolerAllModel: InstructorAssignmentsListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  InstructorAssignmentsListState updateAllInstructorAssignments(
    InstructorAssignmentsListModel instructorassignmentsListModel,
  ) {
    return _copyWith(
      ischoolerAllModel: instructorassignmentsListModel,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  InstructorAssignmentsListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  InstructorAssignmentsListState _copyWith({
    InstructorAssignmentsListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return InstructorAssignmentsListState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
