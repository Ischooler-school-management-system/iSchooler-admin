part of 'instructors_list_cubit.dart';

// @immutable

class InstructorsListState extends EduconnectState {
  const InstructorsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory InstructorsListState.init() {
    return InstructorsListState(
      educonnectAllModel: InstructorsListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  InstructorsListState updateAllInstructors(
      InstructorsListModel instructorsListModel) {
    return _copyWith(
      educonnectAllModel: instructorsListModel,
      status: EduconnectStatus.loaded,
    );
  }

  InstructorsListState _copyWith({
    InstructorsListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return InstructorsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
