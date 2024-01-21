// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

enum AlertHandlingTypes {
  None,
  InternetConnection,
  ServerError,
  AuthenticationError,
  MajorError,
  Alert,
  Other
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
