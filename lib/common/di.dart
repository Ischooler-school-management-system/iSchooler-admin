import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../admin_features/users/admins/data/network/user_network.dart';
import '../admin_features/users/admins/data/repo/admins_repo.dart';
import '../admin_features/users/students/data/repo/students_repo.dart';
import '../auth/data/network/auth_network.dart';
import '../auth/data/repo/auth_repo.dart';
import 'comon_features/error_handling/data/repo/error_handling_repo.dart';
import 'comon_features/loading/data/repo/loading_repo.dart';

/// Instance of Get It
final GetIt getIt = GetIt.instance;

class DependencyInjection {
  static final DependencyInjection _singleton = DependencyInjection._();

  factory DependencyInjection() => _singleton;

  DependencyInjection._();

  /// here we define all networks and repos for the bloc to have a singleton
  /// from each one to be used across all app
  Future<void> registerSingleton() async {
    getIt.registerLazySingleton(() => Dio());
    getIt.registerLazySingleton(() => Connectivity());

    /// register Networks:
    getIt.registerLazySingleton(() => AuthNetwork(getIt()));
    // getIt.registerLazySingleton(() => StudentNetwork(getIt()));
    getIt.registerLazySingleton(() => UserNetwork(getIt()));
    //--------------------------------------------------------------------------
    /// register Repositories:
    getIt.registerLazySingleton(() => LoadingRepository());
    getIt.registerLazySingleton(() => ErrorHandlingRepository());
    getIt
        .registerLazySingleton(() => AuthRepository(getIt(), getIt(), getIt()));
    getIt.registerLazySingleton(() => StudentRepository(getIt(), getIt()));
    getIt.registerLazySingleton(() => AdminRepository(getIt(), getIt()));
    //--------------------------------------------------------------------------
  }
}
