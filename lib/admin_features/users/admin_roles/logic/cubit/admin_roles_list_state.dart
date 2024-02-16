part of 'admin_roles_list_cubit.dart';

// @immutable

class AdminRolesListState extends EduconnectState {
  const AdminRolesListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory AdminRolesListState.init() {
    return AdminRolesListState(
      educonnectAllModel: AdminRolesListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  @override
  AdminRolesListState updateData(EduconnectListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is AdminRolesListModel ? newData : null,
      status: EduconnectStatus.loaded,
    );
  }

  @override
  AdminRolesListState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
    );
  }

  AdminRolesListState _copyWith({
    AdminRolesListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return AdminRolesListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
