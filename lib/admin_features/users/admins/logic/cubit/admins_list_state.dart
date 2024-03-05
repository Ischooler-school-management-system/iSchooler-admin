part of 'admins_list_cubit.dart';

// @immutable

class AdminsListState extends IschoolerListState {
  const AdminsListState({
    required super.ischoolerAllModel,
    required super.status,
  });

  factory AdminsListState.init() {
    return AdminsListState(
      ischoolerAllModel: AdminsListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  AdminsListState updateData(IschoolerListModel newData) {
    return _copyWith(
      ischoolerAllModel: newData is AdminsListModel ? newData : null,
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
    AdminsListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return AdminsListState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerAllModel, status];
}
