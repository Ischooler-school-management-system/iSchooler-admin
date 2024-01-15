part of 'admin_cubit.dart';

enum AdminStatus { init, updated, loaded, failed }
// @immutable

class AdminState extends Equatable {
  final AdminModel adminModel;
  final AdminStatus status;

  const AdminState({
    required this.adminModel,
    required this.status,
  });

  factory AdminState.init() {
    return AdminState(
      adminModel: AdminModel.empty(),
      status: AdminStatus.init,
    );
  }

  AdminState updateAdmin(AdminModel adminModel) {
    return _copyWith(
      adminModel: adminModel,
      status: AdminStatus.loaded,
    );
  }

  AdminState _copyWith({
    AdminModel? adminModel,
    AdminStatus? status,
  }) {
    return AdminState(
      adminModel: adminModel ?? this.adminModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [adminModel];
}
