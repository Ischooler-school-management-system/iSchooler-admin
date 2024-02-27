part of 'admins_list_cubit.dart';

// @immutable

class AdminsListState extends IschoolerListState {
  const AdminsListState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory AdminsListState.init() {
    return AdminsListState(
      educonnectAllModel: AdminsListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  AdminsListState updateData(IschoolerListModel newData) {
    return _copyWith(
      educonnectAllModel: newData is AdminsListModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  AdminsListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  AdminsListState _copyWith({
    AdminsListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return AdminsListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
