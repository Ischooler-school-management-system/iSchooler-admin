part of 'admins_list_cubit.dart';

// @immutable

class AllAdminsState extends EduconnectState {
  const AllAdminsState({
    required super.educonnectAllModel,
    required super.status,
  });

  factory AllAdminsState.init() {
    return AllAdminsState(
      educonnectAllModel: AllAdminsModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  AllAdminsState updateAllAdmins(AllAdminsModel alladminsModel) {
    return _copyWith(
      educonnectAllModel: alladminsModel,
      status: EduconnectStatus.loaded,
    );
  }

  AllAdminsState _copyWith({
    AllAdminsModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return AllAdminsState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  @override
  bool isLoaded() => status == EduconnectStatus.loaded;
  @override
  List<Object> get props => [educonnectAllModel, status];
}
