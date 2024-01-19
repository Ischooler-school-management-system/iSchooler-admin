import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../common/style/educonnect_colors.dart';
import '../admin_features/dashboard/presentation/screens/dashboard_table_screen.dart';
import '../admin_features/users/admins/logic/all_admins_cubit/all_admins_cubit.dart';
import '../admin_features/users/students/logic/all_students_cubit/all_students_cubit.dart';
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
      const DashboardScreen<AllAdminsCubit>(),
      const DashboardScreen<AllStudentsCubit>(),
      const DashboardScreen<AllStudentsCubit>(),
      const DashboardScreen<AllStudentsCubit>(),
      const DashboardScreen<AllStudentsCubit>(),
      const DashboardScreen<AllStudentsCubit>(),
      const DashboardScreen<AllStudentsCubit>(),
      const DashboardScreen<AllStudentsCubit>(),
      const DashboardScreen<AllStudentsCubit>(),
      const DashboardScreen<AllStudentsCubit>(),

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
