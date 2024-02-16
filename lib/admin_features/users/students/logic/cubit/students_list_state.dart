part of 'students_list_cubit.dart';

// @immutable

class StudentsListState extends EduconnectState {
  const StudentsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory StudentsListState.init() {
    return StudentsListState(
      educonnectAllModel: EduconnectListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  @override
  StudentsListState updateData(EduconnectListModel newData) {
    return _copyWith(
      // educonnectAllModel: newData is AdminsListModel ? newData : null,
      educonnectAllModel: newData is StudentsListModel ? newData : null,
      status: EduconnectStatus.loaded,
    );
  }

  @override
  StudentsListState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
    );
  }

  StudentsListState _copyWith({
    EduconnectListModel? educonnectAllModel,
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
