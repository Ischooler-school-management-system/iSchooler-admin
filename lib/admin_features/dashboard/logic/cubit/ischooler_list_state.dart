part of 'ischooler_list_cubit.dart';

enum IschoolerStatus { init, updated, loaded, failed }
// @immutable

class IschoolerListState extends Equatable {
  final IschoolerListModel ischoolerAllModel;
  final IschoolerStatus status;

  const IschoolerListState({
    required this.ischoolerAllModel,
    required this.status,
  });

  factory IschoolerListState.init() {
    return IschoolerListState(
      ischoolerAllModel: IschoolerListModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  IschoolerListState updateData(IschoolerListModel newData) {
    return _copyWith(
      ischoolerAllModel: newData,
      status: IschoolerStatus.loaded,
    );
  }

  IschoolerListState updateStatus({IschoolerStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? IschoolerStatus.updated,
    );
  }

  IschoolerListState _copyWith({
    IschoolerListModel? ischoolerAllModel,
    IschoolerStatus? status,
  }) {
    return IschoolerListState(
      ischoolerAllModel: ischoolerAllModel ?? this.ischoolerAllModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == IschoolerStatus.loaded;

  @override
  List<Object> get props => [ischoolerAllModel];
}
