part of 'auth_cubit.dart';
enum AuthStatus { init, updated, loaded, failed }
// @immutable

class AuthState extends Equatable {
  final AuthModel authModel;
  final AuthStatus status;

  const AuthState({
    required this.authModel,
    required this.status,
  });

  factory AuthState.init() {
    return AuthState(
      authModel: AuthModel.empty(),
      status: AuthStatus.init,
    );
  }

  AuthState updateAuth(AuthModel authModel) {
    return _copyWith(
      authModel: authModel,
      status: AuthStatus.loaded,
    );
  }

  AuthState _copyWith({
    AuthModel? authModel,
    AuthStatus? status,
  }) {
    return AuthState(
      authModel: authModel ?? this.authModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [authModel];
}
