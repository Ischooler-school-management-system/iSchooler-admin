import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';

import '../admin_features/cubits.dart';
import '../admin_features/dashboard/presentation/screens/dashboard_screen.dart';
import '../admin_features/homework/logic/cubit/homeworks_list_cubit.dart';
import '../auth/logic/cubit/auth_cubit.dart';
import '../auth/settings/language/presentation/screens/languages_screen.dart';
import '../common/common_features/widgets/ischooler_icons.dart';
import '../common/ischooler_constants.dart';
import '../common/navigation/ischooler_navi.dart';

class IschoolerSideBarData {
  static final Map<Widget, SidebarXItem> sideBarData = {
    const DashboardScreen<AdminsListCubit>(): SidebarXItem(
      icon: Icons.admin_panel_settings,
      label: IschoolerConstants.localization().admins,
    ),
    const DashboardScreen<AdminRolesListCubit>(): const SidebarXItem(
      icon: Icons.admin_panel_settings,
      label: 'Admins Roles',
    ),
    const DashboardScreen<InstructorsListCubit>(): SidebarXItem(
      icon: IschoolerIcons.teacher_7,
      label: IschoolerConstants.localization().teachers,
    ),
    const DashboardScreen<InstructorAssignmentsListCubit>(): const SidebarXItem(
      icon: IschoolerIcons.teacher_7,
      label: 'Instructor Assignment',
    ),
    const DashboardScreen<StudentsListCubit>(): SidebarXItem(
      icon: Icons.person,
      label: IschoolerConstants.localization().students,
    ),
    const DashboardScreen<ClassesListCubit>(): SidebarXItem(
      icon: Icons.school,
      label: IschoolerConstants.localization().classes,
    ),
    const DashboardScreen<GradesListCubit>(): SidebarXItem(
      icon: Icons.grade,
      label: IschoolerConstants.localization().grades,
    ),
    const DashboardScreen<SubjectsListCubit>(): SidebarXItem(
      icon: Icons.subject,
      label: IschoolerConstants.localization().subjects,
    ),
    // const DashboardScreen<StudentsListCubit>(): SidebarXItem(
    //   icon: Icons.schedule,
    //   label: IschoolerConstants.localization().timetable,
    // ),
    // const DashboardScreen<StudentsListCubit>(): SidebarXItem(
    //   icon: Icons.assignment,
    //   label: IschoolerConstants.localization().exams,
    // ),
    const DashboardScreen<HomeworksListCubit>(): SidebarXItem(
      icon: Icons.assignment_turned_in,
      label: IschoolerConstants.localization().homeworks,
    ),
    // const DashboardScreen<StudentsListCubit>(): SidebarXItem(
    //   icon: Icons.account_circle,
    //   label: IschoolerConstants.localization().profile,
    // ),
    const LanguagesScreen(): SidebarXItem(
      icon: Icons.settings,
      label: IschoolerConstants.localization().settings,
    ),
    const Text('Empty Tab'): SidebarXItem(
      icon: Icons.logout,
      label: IschoolerConstants.localization().sign_out,
      onTap: () {
        currentContext!.read<AuthCubit>().signOut();
      },
    ),
  };
}
