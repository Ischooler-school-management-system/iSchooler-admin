part of 'admin_roles_list_cubit.dart';

// @immutable

class AdminRolesListState extends IschoolerListState {
  const AdminRolesListState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory AdminRolesListState.init() {
    return AdminRolesListState(
      ischoolerAllModel: AdminRolesListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  AdminRolesListState updateData(IschoolerListModel newData) {
    return _copyWith(
      ischoolerAllModel: newData is AdminRolesListModel ? newData : null,
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
    AdminRolesListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return AdminRolesListState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
