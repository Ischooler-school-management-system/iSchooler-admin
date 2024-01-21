import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../../../../educonnect_constants.dart';
import '../../../../madpoly.dart';
import '../../data/models/alert_handling_model.dart';
import '../../data/repo/alert_handling_repo.dart';

part 'error_handling_state.dart';

class ErrorHandlingCubit extends Cubit<ErrorHandlingState> {
  final AlertHandlingRepository _errorHandlingRepository;

  late StreamSubscription<AlertHandlingModel> _errorHandlingStreamSubscription;

  late StreamSubscription<ConnectivityResult> _networkErrorStreamSubscription;

  ErrorHandlingCubit(AlertHandlingRepository errorHandlingRepository)
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
            AlertHandlingModel(
              message:
                  EduconnectConstants.localization().no_internet_connection,
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