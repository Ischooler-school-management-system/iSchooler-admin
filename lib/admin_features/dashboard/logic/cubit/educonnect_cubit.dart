import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/educonnect_model.dart';

part 'educonnect_state.dart';

abstract class EduconnectCubit<S extends EduconnectState> extends Cubit<S> {
  EduconnectCubit(super.initialState);

  Future<void> getAllItems();
  Future<void> addItem({required EduconnectModel model});
  Future<void> updateItem({required EduconnectModel model});
  Future<void> deleteItem({required EduconnectModel model});
}
