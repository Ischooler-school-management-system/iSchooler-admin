part of 'error_handling_cubit.dart';

class ErrorHandlingState extends Equatable {
  final AlertHandlingModel error;
  const ErrorHandlingState(this.error);

  factory ErrorHandlingState.init() {
    return ErrorHandlingState(AlertHandlingModel.none);
  }

  ErrorHandlingState updateError(AlertHandlingModel error) {
    return ErrorHandlingState(error);
  }

  @override
  List<Object> get props => [error];
}
