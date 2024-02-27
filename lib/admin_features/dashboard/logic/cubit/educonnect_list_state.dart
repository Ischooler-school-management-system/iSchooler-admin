part of 'educonnect_list_cubit.dart';

enum IschoolerStatus { init, updated, loaded, failed }
// @immutable

class IschoolerListState extends Equatable {
  final IschoolerListModel educonnectAllModel;
  final IschoolerStatus status;

  const IschoolerListState({
    required this.educonnectAllModel,
    required this.status,
  });

  factory IschoolerListState.init() {
    return IschoolerListState(
      educonnectAllModel: IschoolerListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  IschoolerListState updateData(IschoolerListModel newData) {
    return _copyWith(
      educonnectAllModel: newData,
      status: IschoolerStatus.loaded,
    );
  }

  IschoolerListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  IschoolerListState _copyWith({
    IschoolerListModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return IschoolerListState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == IschoolerStatus.loaded;

  @override
  List<Object> get props => [educonnectAllModel];
}
