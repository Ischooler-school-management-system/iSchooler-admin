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

  AdminRolesListState updateAllAdminRoles(
      AdminRolesListModel adminrolesListModel) {
    return _copyWith(
      educonnectAllModel: adminrolesListModel,
      status: EduconnectStatus.loaded,
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
