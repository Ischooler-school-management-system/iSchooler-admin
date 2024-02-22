part of 'admin_roles_list_cubit.dart';

// @immutable

class AdminRolesListState extends IschoolerState {
  const AdminRolesListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory AdminRolesListState.init() {
    return AdminRolesListState(
      educonnectAllModel: AdminRolesListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  AdminRolesListState updateData(IschoolerListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is AdminRolesListModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  AdminRolesListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  AdminRolesListState _copyWith({
    AdminRolesListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return AdminRolesListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
