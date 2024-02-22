part of 'educonnect_cubit.dart';

enum IschoolerStatus { init, updated, loaded, failed }
// @immutable

class IschoolerState extends Equatable {
  final IschoolerListModel educonnectAllModel;
  final IschoolerStatus status;

  const IschoolerState({
    required this.educonnectAllModel,
    required this.status,
  });

  factory IschoolerState.init() {
    return IschoolerState(
      educonnectAllModel: IschoolerListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  IschoolerState updateData(IschoolerListModel newData) {
    return _copyWith(
      educonnectAllModel: newData,
      status: IschoolerStatus.loaded,
    );
  }

  IschoolerState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  IschoolerState _copyWith({
    IschoolerListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return IschoolerState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == IschoolerStatus.loaded;

  @override
  List<Object> get props => [educonnectAllModel];
}
