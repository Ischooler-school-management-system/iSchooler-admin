part of 'user_cubit.dart';

enum UserStatus { init, updated, loaded, failed }
// @immutable

class UserState extends Equatable {
  final UserModel userModel;
  final UserStatus status;

  const UserState({
    required this.userModel,
    required this.status,
  });

  factory UserState.init() {
    return UserState(
      userModel: UserModel.empty(),
      status: UserStatus.init,
    );
  }

  UserState updateUser(UserModel userModel) {
    return _copyWith(
      userModel: userModel,
      status: UserStatus.loaded,
    );
  }

  UserState _copyWith({
    UserModel? userModel,
    UserStatus? status,
  }) {
    return UserState(
      userModel: userModel ?? this.userModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [userModel];
}
