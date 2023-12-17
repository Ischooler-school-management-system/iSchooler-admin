import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/loading_model.dart';
import '../../data/repo/loading_repo.dart';

part 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  final LoadingRepository _loadingRepository;

  late StreamSubscription<LoadingModel> _loadingStreamSubscription;

  LoadingCubit(LoadingRepository loadingRepository)
      : _loadingRepository = loadingRepository,
        super(LoadingState.init()) {
    _loadingStreamSubscription =
        _loadingRepository.loadingStatus.listen((event) {
      _onLoadingUpdated(event);
    });
  }

  Future<void> _onLoadingUpdated(LoadingModel loading) async {
    /* Madpoly.print(loading.place,
        developer: "Ahmed", tag: "LoadingCubit", isLog: true);
*/
    // update UI
    emit(state.updateLoading(loading));
  }

  @override
  Future<void> close() {
    _loadingStreamSubscription.cancel();
    _loadingRepository.close();
    return super.close();
  }
}
///before event ae after
///