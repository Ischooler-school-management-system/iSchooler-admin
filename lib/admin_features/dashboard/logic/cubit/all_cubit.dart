import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/educonnect_model.dart';

abstract class EduconnectCubit extends Cubit<EduconnectState> {
  EduconnectCubit(super.initialState);

  Future<void> getAllData();
  Future<void> add({required EduconnectModel educonnectModel});
}

enum EduconnectStatus { init, updated, loaded, failed }
// @immutable

class EduconnectState extends Equatable {
  final EduconnectAllModel educonnectAllModel;
  final EduconnectStatus status;

  const EduconnectState({
    required this.educonnectAllModel,
    required this.status,
  });

  factory EduconnectState.init() {
    return EduconnectState(
      educonnectAllModel: EduconnectAllModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  EduconnectState updateEduconnect(EduconnectAllModel educonnectModel) {
    return _copyWith(
      educonnectAllModel: educonnectModel,
      status: EduconnectStatus.loaded,
    );
  }

  EduconnectState _copyWith({
    EduconnectAllModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return EduconnectState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == EduconnectStatus.loaded;

  @override
  List<Object> get props => [educonnectAllModel];
}
