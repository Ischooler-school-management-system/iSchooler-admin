part of 'instructor_assignments_list_cubit.dart';

// @immutable

class InstructorAssignmentsListState extends EduconnectState {
  const InstructorAssignmentsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory InstructorAssignmentsListState.init() {
    return InstructorAssignmentsListState(
      educonnectAllModel: InstructorAssignmentsListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  InstructorAssignmentsListState updateAllInstructorAssignments(
      InstructorAssignmentsListModel instructorassignmentsListModel) {
    return _copyWith(
      educonnectAllModel: instructorassignmentsListModel,
      status: EduconnectStatus.loaded,
    );
  }

  InstructorAssignmentsListState _copyWith({
    InstructorAssignmentsListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return InstructorAssignmentsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
