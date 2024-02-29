part of 'profile_cubit.dart';

// @immutable

class ProfileState extends IschoolerState {
  const ProfileState({
    required super.ischoolerModel,
    required super.status,
  });

  factory ProfileState.init() {
    return ProfileState(
      ischoolerModel: IschoolerModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  @override
  ProfileState updateData(IschoolerModel newData) {
    return _copyWith(
      // ischoolerModel: newData is AdminsListModel ? newData : null,
      ischoolerModel: newData is AdminModel ? newData : null,
      status: IschoolerStatus.loaded,
    );
  }

  @override
  ProfileState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  ProfileState _copyWith({
    IschoolerModel? ischoolerModel,
    IschoolerStatus? status,
  }) {
    return ProfileState(
      ischoolerModel: ischoolerModel ?? this.ischoolerModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == IschoolerStatus.loaded;
  @override
  List<Object> get props => [ischoolerModel, status];
}
