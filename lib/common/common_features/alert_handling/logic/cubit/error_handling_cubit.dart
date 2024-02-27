import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../../../../ischooler_constants.dart';
import '../../data/models/alert_handling_model.dart';
import '../../data/repo/alert_handling_repo.dart';

part 'error_handling_state.dart';

class ErrorHandlingCubit extends Cubit<ErrorHandlingState> {
  final AlertHandlingRepository _alertHandlingRepository;

  late StreamSubscription<AlertHandlingModel> _errorHandlingStreamSubscription;

  late StreamSubscription<ConnectivityResult> _networkErrorStreamSubscription;

  ErrorHandlingCubit(AlertHandlingRepository alertHandlingRepository)
      : _alertHandlingRepository = alertHandlingRepository,
        super(ErrorHandlingState.init()) {
    _errorHandlingStreamSubscription =
        _alertHandlingRepository.errorStatus.listen((event) {
      _onErrorUpdated(event);
    });

    final Connectivity connectivity = getIt<Connectivity>();

    _networkErrorStreamSubscription = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          _onErrorUpdated(
            AlertHandlingModel(
              message: IschoolerConstants.localization().no_internet_connection,
              type: AlertHandlingTypes.InternetConnection,
              showToast: true,
            ),
          );
        } else if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          _onErrorUpdated(
            AlertHandlingModel.none,
          );
        }
      },
    );
  }

  Future<void> _onErrorUpdated(AlertHandlingModel error) async {
    /*  Madpoly.print(
      error.message,
      developer: "Ahmed",
      tag: "ErrorHandlingCubit",
    );
 */
    // update UI
    emit(state.updateError(error));
  }

  @override
  Future<void> close() {
    _errorHandlingStreamSubscription.cancel();
    _alertHandlingRepository.close();
    _networkErrorStreamSubscription.cancel();
    return super.close();
  }
}
