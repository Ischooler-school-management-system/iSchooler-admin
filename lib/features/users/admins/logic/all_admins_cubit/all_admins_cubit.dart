import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/features/loading/data/models/loading_model.dart';
import '../../../../../common/features/loading/data/repo/loading_repo.dart';
import '../../data/models/admin_model.dart';
import '../../data/models/all_admins_model.dart';
import '../../data/repo/admins_repo.dart';

part 'all_admins_state.dart';

class AllAdminsCubit extends Cubit<AllAdminsState> {
  final AdminRepository _adminRepository;
  final LoadingRepository _loadingRepository;

  AllAdminsCubit(
    AdminRepository adminRepository,
    LoadingRepository loadingRepository,
  )   : _adminRepository = adminRepository,
        _loadingRepository = loadingRepository,
        super(AllAdminsState.init());

  Future<void> getAllAdminsData() async {
    _loadingRepository.startLoading(LoadingType.normal);
    AllAdminsModel response = await _adminRepository.getAllAdminsData();
    emit(state.updateAllAdmins(response));
    _loadingRepository.stopLoading();
  }

  Future<void> addAdmin({required AdminModel admin}) async {
    _loadingRepository.startLoading(LoadingType.normal);

    await _adminRepository.addAdmin(admin: admin);
    await getAllAdminsData();
    // _loadingRepository.stopLoading();
  }
}
