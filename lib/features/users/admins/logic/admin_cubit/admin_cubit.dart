import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/features/loading/data/models/loading_model.dart';
import '../../../../../common/features/loading/data/repo/loading_repo.dart';
import '../../data/models/admin_model.dart';
import '../../data/repo/admins_repo.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final AdminRepository _adminRepository;
  final LoadingRepository _loadingRepository;

  AdminCubit(
    AdminRepository adminRepository,
    LoadingRepository loadingRepository,
  )   : _adminRepository = adminRepository,
        _loadingRepository = loadingRepository,
        super(AdminState.init());

  Future<void> storeAdminData({required AdminModel admin}) async {
    _loadingRepository.startLoading(LoadingType.normal);
    await _adminRepository.storeAdminData(admin: admin);

    _loadingRepository.stopLoading();
  }
}
