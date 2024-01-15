part of 'error_handling_cubit.dart';

class ErrorHandlingState extends Equatable {
  final ErrorHandlingModel error;
  const ErrorHandlingState(this.error);

  factory ErrorHandlingState.init() {
    return ErrorHandlingState(ErrorHandlingModel.none);
  }

  ErrorHandlingState updateError(ErrorHandlingModel error) {
    return ErrorHandlingState(error);
  }

  @override
  List<Object> get props => [error];
}
