import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/educonnect_model.dart';

part 'educonnect_state.dart';

abstract class IschoolerCubit<S extends IschoolerState> extends Cubit<S> {
  IschoolerCubit(super.initialState);

  Future<void> getAllItems();
  Future<void> addItem({required IschoolerModel model});
  Future<void> updateItem({required IschoolerModel model});
  Future<void> deleteItem({required IschoolerModel model});
}
