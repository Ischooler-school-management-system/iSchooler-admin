import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app_constants.dart';
import '../../../../di.dart';
import '../../../../madpoly.dart';
import '../../data/models/error_handling_model.dart';
import '../../data/repo/error_handling_repo.dart';

part 'error_handling_state.dart';

class ErrorHandlingCubit extends Cubit<ErrorHandlingState> {
  final ErrorHandlingRepository _errorHandlingRepository;

  late StreamSubscription<ErrorHandlingModel> _errorHandlingStreamSubscription;

  late StreamSubscription<ConnectivityResult> _networkErrorStreamSubscription;

  ErrorHandlingCubit(ErrorHandlingRepository errorHandlingRepository)
      : _errorHandlingRepository = errorHandlingRepository,
        super(ErrorHandlingState.init()) {
    _errorHandlingStreamSubscription =
        _errorHandlingRepository.errorStatus.listen((event) {
      _onErrorUpdated(event);
    });

    final Connectivity connectivity = getIt<Connectivity>();

    _networkErrorStreamSubscription = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          _onErrorUpdated(
            ErrorHandlingModel(
              message: MawjoodConstants.localization().no_internet_connection,
              type: ErrorHandlingTypes.InternetConnection,
              showToast: true,
            ),
          );
        } else if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          _onErrorUpdated(
            ErrorHandlingModel.none,
          );
        }
      },
    );
  }

  Future<void> _onErrorUpdated(ErrorHandlingModel error) async {
    Madpoly.print(
      error.message,
      developer: "Ahmed",
      tag: "ErrorHandlingCubit",
      isLog: true,
    );

    // update UI
    emit(state.updateError(error));
  }

  @override
  Future<void> close() {
    _errorHandlingStreamSubscription.cancel();
    _errorHandlingRepository.close();
    _networkErrorStreamSubscription.cancel();
    return super.close();
  }
}
