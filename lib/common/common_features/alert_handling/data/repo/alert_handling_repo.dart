import 'dart:async';

import '../../../../madpoly.dart';
import '../models/alert_handling_model.dart';

class AlertHandlingRepository {
  final _controller = StreamController<AlertHandlingModel>();

  void _updateError(AlertHandlingModel error) {
    _controller.add(error);
  }

  Stream<AlertHandlingModel> get errorStatus async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AlertHandlingModel.none;
    yield* _controller.stream;
  }

  Future<void> addError(
    String message,
    AlertHandlingTypes type, {
    String? developerMessage,
    String? tag,
    bool showToast = false,
  }) async {
    final bool isAuthMessage =
        message.isNotEmpty && message == 'Unauthenticated';

    final bool isAuthErrorType = type == AlertHandlingTypes.AuthenticationError;

    AlertHandlingTypes errorType = type;

    if (isAuthErrorType && !isAuthMessage) {
      errorType = AlertHandlingTypes.ServerError;
    }

    final AlertHandlingModel error = AlertHandlingModel(
        message: message,
        type: errorType,
        showToast: (showToast && message.isNotEmpty));
    Madpoly.print(
      'alert= $error, developerMessage = ',
      inspectObject: developerMessage,
      developer: "Ziad",
      color: type == AlertHandlingTypes.Alert
          ? MadpolyColor.green
          : MadpolyColor.red,
      tag: "AlertHandlingRepository > show toast= $showToast > ${tag ?? ''}",
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
