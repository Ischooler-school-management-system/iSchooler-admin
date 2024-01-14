import 'dart:async';

import '../../../../madpoly.dart';
import '../models/error_handling_model.dart';

class ErrorHandlingRepository {
  final _controller = StreamController<ErrorHandlingModel>();

  void _updateError(ErrorHandlingModel error) {
    _controller.add(error);
  }

  Stream<ErrorHandlingModel> get errorStatus async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield ErrorHandlingModel.none;
    yield* _controller.stream;
  }

  Future<void> addError(
    String message,
    ErrorHandlingTypes type, {
    String? developerMessage,
    String? tag,
    bool showToast = false,
  }) async {
    final bool isAuthMessage =
        message.isNotEmpty && message == 'Unauthenticated';

    final bool isAuthErrorType = type == ErrorHandlingTypes.AuthenticationError;

    ErrorHandlingTypes errorType = type;

    if (isAuthErrorType && !isAuthMessage) {
      errorType = ErrorHandlingTypes.ServerError;
    }

    final ErrorHandlingModel error = ErrorHandlingModel(
        message: message,
        type: errorType,
        showToast: (showToast && message.isNotEmpty));

    Madpoly.print(
      '$error , developerMessage = $developerMessage',
      developer: "Ahmed",
      isInspect: true,
      isLog: true,
      tag: "ErrorHandlingRepository show toast= $showToast  ${tag ?? ''}",
    );

    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _updateError(error),
    );
  }

  void close() {
    _controller.close();
  }
}
