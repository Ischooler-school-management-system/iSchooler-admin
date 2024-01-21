import 'package:flutter/material.dart';
import 'package:school_admin/admin_features/classes/logic/instructors_list_cubit/classes_list_cubit.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../common/style/educonnect_colors.dart';
import '../admin_features/dashboard/presentation/screens/dashboard_screen.dart';
import '../admin_features/users/admins/logic/admins_list_cubit/admins_list_cubit.dart';
import '../admin_features/users/instructor/logic/instructors_list_cubit/instructors_list_cubit.dart';
import '../admin_features/users/students/logic/students_list_cubit/students_list_cubit.dart';
import '../auth/settings/language/presentation/screens/languages_screen.dart';
import '../common/comon_features/widgets/educonnect_screen.dart';
import '../common/madpoly.dart';
import 'sidebar_x.dart';

const primaryColor = canvasColor;
const canvasColor = EduconnectColors.blue;
const scaffoldBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
const accentCanvasColor = EduconnectColors.grey;
const white = Colors.white;
final divider = Divider(color: white.withOpacity(0.3), height: 1);

class EduconnectSideBar extends StatefulWidget {
  const EduconnectSideBar({super.key});

  @override
  State<EduconnectSideBar> createState() => _EduconnectSideBarState();
}

class _EduconnectSideBarState extends State<EduconnectSideBar> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'educonnect_side_bar > build',
      developer: "Ziad",
    );
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    final List<Widget> tabBodies = [
      const DashboardScreen<AdminsListCubit>(),
      const DashboardScreen<InstructorsListCubit>(),
      const DashboardScreen<StudentsListCubit>(),
      const DashboardScreen<ClassesListCubit>(),
      const DashboardScreen<StudentsListCubit>(),
      const DashboardScreen<StudentsListCubit>(),
      const DashboardScreen<StudentsListCubit>(),
      const DashboardScreen<StudentsListCubit>(),
      const DashboardScreen<StudentsListCubit>(),
      const DashboardScreen<StudentsListCubit>(),

      // const SettingsTab(),
      const LanguagesScreen(),
      const EmptyTab(),
    ];
    return EduconnectScreen(
      // key: _key,
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: Colors.transparent,
            )
          : null,
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return tabBodies[_controller.selectedIndex];
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyTab extends StatelessWidget {
  const EmptyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Empty Tab');
  }
}
