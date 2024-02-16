part of 'admins_list_cubit.dart';

// @immutable

class AdminsListState extends EduconnectState {
  const AdminsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory AdminsListState.init() {
    return AdminsListState(
      educonnectAllModel: AdminsListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  @override
  AdminsListState updateData(EduconnectListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is AdminsListModel ? newData : null,
      status: EduconnectStatus.loaded,
    );
  }

  @override
  AdminsListState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
    );
  }

  AdminsListState _copyWith({
    AdminsListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return AdminsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
