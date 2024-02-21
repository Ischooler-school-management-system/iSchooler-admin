// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

enum AlertHandlingTypes {
  /// shows a toast describing the issue
  ///   - used in catch errors in the logic functions
  ServerError,

  /// shows a snackbar describing the issue
  InternetConnection,

  /// shows a snackbar describing the issue with a login button that redirects the user to the auth screen
  AuthenticationError,

  /// makes a instant logout
  MajorError,
  MajorUiError,

  /// (used in the logic functions when request is successful) shows a toast describing the excuted request
  Alert,
  None,
  Other,
}

class AlertHandlingModel extends Equatable {
  final String message;
  final AlertHandlingTypes type;
  final DateTime createdAt;
  final bool showToast;

  AlertHandlingModel({
    required this.message,
    required this.type,
    this.showToast = false,
  }) : createdAt = DateTime.now();

  static AlertHandlingModel none = AlertHandlingModel(
    message: "",
    type: AlertHandlingTypes.None,
    showToast: false,
  );

  @override
  List<Object?> get props => [message, type, showToast, createdAt];
}
