import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_admin/common/network/educonnect_response.dart';

import '../../../../common/educonnect_model.dart';

abstract class EduconnectCubit extends Cubit<EduconnectState> {
  EduconnectCubit(super.initialState);

  Future<void> getAllItems();
  Future<void> addItem(
      {required EduconnectModel model, bool isEditing = false});
  Future<void> deleteItem({required EduconnectModel model});
}

abstract class EduconnectRepository {
  //model is sent here to get the type of request only
  Future<EduconnectModelList> getAllItems({required EduconnectModelList model});
  Future<bool> addItem(
      {required EduconnectModel model, required bool addWithId});
  Future<bool> deleteItem({required EduconnectModel model});
}

abstract class EduconnectNetwork {
  //model is sent here to get the type of request only
  Future<EduconnectResponse> getAllItems({required EduconnectModelList model});
  Future<bool> addItem(
      {required EduconnectModel model, required bool addWithId});
  Future<bool> deleteItem({required EduconnectModel model});
}

enum EduconnectStatus { init, updated, loaded, failed }
// @immutable

class EduconnectState extends Equatable {
  final EduconnectModelList educonnectAllModel;
  final EduconnectStatus status;

  const EduconnectState({
    required this.educonnectAllModel,
    required this.status,
  });

  factory EduconnectState.init() {
    return EduconnectState(
      educonnectAllModel: EduconnectModelList.empty(),
      status: EduconnectStatus.init,
    );
  }

  EduconnectState updateEduconnect(EduconnectModelList educonnectModel) {
    return _copyWith(
      educonnectAllModel: educonnectModel,
      status: EduconnectStatus.loaded,
    );
  }

  EduconnectState _copyWith({
    EduconnectModelList? educonnectAllModel,
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
