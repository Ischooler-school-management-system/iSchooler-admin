import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../admin_features/users/admins/logic/admin_cubit/admin_cubit.dart';
import '../admin_features/users/admins/logic/all_admins_cubit/all_admins_cubit.dart';
import '../admin_features/users/students/logic/all_students_cubit/all_students_cubit.dart';
import '../admin_features/users/students/logic/student_cubit/student_cubit.dart';
import '../auth/logic/cubit/auth_cubit.dart';
import '../auth/settings/language/language_bloc/language_bloc.dart';
import '../common/comon_features/error_handling/logic/cubit/error_handling_cubit.dart';
import '../common/comon_features/loading/logic/cubit/loading_cubit.dart';
import '../common/di.dart';

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
      BlocProvider(create: (_) => StudentCubit(getIt(), getIt())),
      BlocProvider(create: (_) => AllStudentsCubit(getIt(), getIt())),
      BlocProvider(create: (_) => AdminCubit(getIt(), getIt())),
      BlocProvider(create: (_) => AllAdminsCubit(getIt(), getIt())),
    ],
    child: child,
  );
}
