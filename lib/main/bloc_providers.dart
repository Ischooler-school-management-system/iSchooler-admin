import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/di.dart';
import '../common/features/error_handling/logic/cubit/error_handling_cubit.dart';
import '../common/features/loading/logic/cubit/loading_cubit.dart';
import '../features/auth/logic/cubit/auth_cubit.dart';
import '../features/auth/settings/language/language_bloc/language_bloc.dart';
import '../features/users/students/logic/cubit/students_cubit.dart';

/// here we define all blocs used in the app
/// and the required properties is only added by passing getIt()
/// after the class which is required is defined in the DI
MultiBlocProvider listOfBlocProviders({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ErrorHandlingCubit(getIt())),
      BlocProvider(create: (_) => LoadingCubit(getIt())),
      BlocProvider(create: (_) => LangBloc()),
      BlocProvider(create: (_) => AuthCubit(getIt(), getIt())),
      BlocProvider(create: (_) => StudentCubit()),
    ],
    child: child,
  );
}
