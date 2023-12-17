import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/error_handling/data/repo/error_handling_repo.dart';
import 'features/loading/data/repo/loading_repo.dart';

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
    // getIt.registerLazySingleton(() => LoginNetwork(getIt(), getIt()));
    //--------------------------------------------------------------------------
    /// register Repositories:
    getIt.registerLazySingleton(() => LoadingRepository());
    getIt.registerLazySingleton(() => ErrorHandlingRepository());
    //--------------------------------------------------------------------------
  }
}
