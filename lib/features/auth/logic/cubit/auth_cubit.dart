import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/features/loading/data/models/loading_model.dart';
import '../../../../common/features/loading/data/repo/loading_repo.dart';
import '../../data/models/auth_model.dart';
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

  Future<void> signUp({required String email, required String password}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _authRepository.signUp(email: email, password: password);
    _loadingRepository.stopLoading();
    // emit(state.updateAuth(userModel));
  }

  Future<void> signIn({required String email, required String password}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _authRepository.signIn(email: email, password: password);
    _loadingRepository.stopLoading();
    // emit(state.updateAuth(userModel));
  }

  Future<void> signOut() async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _authRepository.signOut();
    _loadingRepository.stopLoading();
    // emit(state.updateAuth(userModel));
  }
}
