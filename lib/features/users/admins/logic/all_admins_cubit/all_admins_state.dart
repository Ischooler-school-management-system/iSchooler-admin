part of 'all_admins_cubit.dart';

enum AllAdminsStatus { init, updated, loaded, failed }
// @immutable

class AllAdminsState extends Equatable {
  final AllAdminsModel alladminsModel;
  final AllAdminsStatus status;

  const AllAdminsState({
    required this.alladminsModel,
    required this.status,
  });

  factory AllAdminsState.init() {
    return AllAdminsState(
      alladminsModel: AllAdminsModel.empty(),
      status: AllAdminsStatus.init,
    );
  }

  AllAdminsState updateAllAdmins(AllAdminsModel alladminsModel) {
    return _copyWith(
      alladminsModel: alladminsModel,
      status: AllAdminsStatus.loaded,
    );
  }

  AllAdminsState _copyWith({
    AllAdminsModel? alladminsModel,
    AllAdminsStatus? status,
  }) {
    return AllAdminsState(
      alladminsModel: alladminsModel ?? this.alladminsModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == AllAdminsStatus.loaded;
  @override
  List<Object> get props => [alladminsModel, status];
}
