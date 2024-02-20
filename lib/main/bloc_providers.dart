import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_admin/admin_features/weekly_timetable/logic/cubit/weekly_timetable_cubit.dart';

import '../admin_features/cubits.dart';
import '../admin_features/weekly_timetable/weekday/logic/cubit/weekday_cubit.dart';
import '../admin_features/weekly_timetable/weekly_session/logic/cubit/weekly_sessions_cubit.dart';
import '../admin_features/weekly_timetable/weekly_timetable_day/logic/cubit/weekly_timetable_day_cubit.dart';
import '../auth/logic/cubit/auth_cubit.dart';
import '../auth/settings/language/language_bloc/language_bloc.dart';
import '../common/comon_features/alert_handling/logic/cubit/error_handling_cubit.dart';
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
      BlocProvider(create: (_) => StudentsListCubit(getIt(), getIt())),
      BlocProvider(create: (_) => AdminsListCubit(getIt(), getIt())),
      BlocProvider(create: (_) => AdminRolesListCubit(getIt(), getIt())),
      BlocProvider(create: (_) => InstructorsListCubit(getIt(), getIt())),
      BlocProvider(
          create: (_) => InstructorAssignmentsListCubit(getIt(), getIt())),
      BlocProvider(create: (_) => ClassesListCubit(getIt(), getIt())),
      BlocProvider(create: (_) => GradesListCubit(getIt(), getIt())),
      BlocProvider(create: (_) => SubjectsListCubit(getIt(), getIt())),
      BlocProvider(create: (_) => WeeklyTimetableCubit(getIt(), getIt())),
      BlocProvider(create: (_) => WeekdaysCubit(getIt(), getIt())),
      BlocProvider(create: (_) => WeeklySessionsCubit(getIt(), getIt())),
      BlocProvider(create: (_) => WeeklyTimetableDaysCubit(getIt(), getIt())),
    ],
    child: child,
  );
}
