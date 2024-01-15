part of 'auth_cubit.dart';

enum AuthStatus { init, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;

  const AuthState({
    required this.status,
  });

  factory AuthState.init() {
    return const AuthState(
      status: AuthStatus.init,
    );
  }

  AuthState updateAuth() {
    var copyWith = _copyWith(
      status: AuthStatus.authenticated,
    );
    Madpoly.print(
      'new state = $copyWith',
      tag: 'auth_state > updateauth',
      developer: "Ziad",
    );
    return copyWith;
  }

  AuthState updateUnauth() {
    var copyWith = _copyWith(
      status: AuthStatus.unauthenticated,
    );
    Madpoly.print(
      'new state = $copyWith',
      tag: 'auth_state > updateUnauth',
      developer: "Ziad",
    );
    return copyWith;
  }

  AuthState _copyWith({
    AuthStatus? status,
  }) {
    return AuthState(status: status ?? this.status);
  }

  bool isAuthenticated() => status == AuthStatus.authenticated;
  bool isUnauthenticated() => status == AuthStatus.unauthenticated;
  @override
  List<Object> get props => [status];
}
