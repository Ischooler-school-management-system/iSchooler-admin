import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/features/loading/data/models/loading_model.dart';
import '../../../../common/features/loading/data/repo/loading_repo.dart';
import '../../../../common/madpoly.dart';
import '../../../users/admins/data/models/admin_model.dart';
import '../../../users/user_model.dart';
import '../../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final LoadingRepository _loadingRepository;

  AuthCubit(
    AuthRepository authRepository,
    LoadingRepository loadingRepository,
  )   : _authRepository = authRepository,
        _loadingRepository = loadingRepository,
        super(AuthState.init());

  Future<void> signUp(
      {required UserModel user, required String password}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    UserModel userModel =
        await _authRepository.signUp(user: user, password: password);
    if (userModel.id != '') {
      emit(state.updateAuth());
    }
    _loadingRepository.stopLoading();
  }

  Future<void> signIn({required String email, required String password}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    UserModel userModel =
        await _authRepository.signIn(email: email, password: password);
    if (userModel.id != '') {
      emit(state.updateAuth());
    }
    _loadingRepository.stopLoading();
  }

  Future<void> signOut() async {
    _loadingRepository.startLoading(LoadingType.normal);
    bool isUnauth = await _authRepository.signOut();
    if (isUnauth) {
      emit(state.updateUnauth());
    }
    _loadingRepository.stopLoading();
  }
}
