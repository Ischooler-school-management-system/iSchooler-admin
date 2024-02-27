import 'package:equatable/equatable.dart';

import '../../../../common/ischooler_model.dart';
import 'ischooler_list_cubit.dart';

class IschoolerState extends Equatable {
  final IschoolerModel ischoolerModel;
  final IschoolerStatus status;

  const IschoolerState({
    required this.ischoolerModel,
    required this.status,
  });

  factory IschoolerState.init() {
    return IschoolerState(
      ischoolerModel: IschoolerModel.empty(),
      status: IschoolerStatus.init,
    );
  }

  IschoolerState updateData(IschoolerModel newData) {
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
    IschoolerModel? educonnectAllModel,
    IschoolerStatus? status,
  }) {
    return IschoolerState(
      ischoolerModel: educonnectAllModel ?? ischoolerModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == IschoolerStatus.loaded;

  @override
  List<Object> get props => [ischoolerModel];
}
