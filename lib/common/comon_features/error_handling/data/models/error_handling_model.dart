// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

enum ErrorHandlingTypes {
  None,
  InternetConnection,
  ServerError,
  AuthenticationError,
  MajorError,
  Alert,
  Other
}

class ErrorHandlingModel extends Equatable {
  final String message;
  final ErrorHandlingTypes type;
  final DateTime createdAt;
  final bool showToast;

  ErrorHandlingModel({
    required this.message,
    required this.type,
    this.showToast = false,
  }) : createdAt = DateTime.now();

  static ErrorHandlingModel none = ErrorHandlingModel(
    message: "",
    type: ErrorHandlingTypes.None,
    showToast: false,
  );

  @override
  List<Object?> get props => [message, type, showToast, createdAt];
}
