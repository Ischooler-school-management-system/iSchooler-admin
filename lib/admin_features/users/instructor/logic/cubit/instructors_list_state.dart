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

  @override
  InstructorsListState updateData(newData) {
    return _copyWith(
      educonnectAllModel: newData is InstructorsListModel ? newData : null,
      status: EduconnectStatus.loaded,
    );
  }

  @override
  InstructorsListState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
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
