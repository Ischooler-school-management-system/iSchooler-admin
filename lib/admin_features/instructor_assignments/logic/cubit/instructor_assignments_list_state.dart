part of 'instructor_assignments_list_cubit.dart';

// @immutable

class InstructorAssignmentsListState extends IschoolerListState {
  const InstructorAssignmentsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory InstructorAssignmentsListState.init() {
    return InstructorAssignmentsListState(
      educonnectAllModel: InstructorAssignmentsListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  InstructorAssignmentsListState updateAllInstructorAssignments(
    InstructorAssignmentsListModel instructorassignmentsListModel,
  ) {
    return _copyWith(
      educonnectAllModel: instructorassignmentsListModel,
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
    InstructorAssignmentsListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return InstructorAssignmentsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
