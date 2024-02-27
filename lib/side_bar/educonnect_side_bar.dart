import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../common/style/educonnect_colors.dart';
import '../admin_features/cubits.dart';
import '../admin_features/dashboard/presentation/screens/dashboard_screen.dart';
import '../admin_features/homework/logic/cubit/homeworks_list_cubit.dart';
import '../auth/settings/language/presentation/screens/languages_screen.dart';
import '../common/common_features/widgets/educonnect_screen.dart';
import '../common/madpoly.dart';
import 'sidebar_x.dart';

const primaryColor = canvasColor;
const canvasColor = IschoolerColors.blue;
const scaffoldBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
const accentCanvasColor = IschoolerColors.grey;
const white = Colors.white;
final divider = Divider(color: white.withOpacity(0.3), height: 1);

class IschoolerSideBar extends StatefulWidget {
  const IschoolerSideBar({super.key});

  @override
  State<IschoolerSideBar> createState() => _IschoolerSideBarState();
}

class _IschoolerSideBarState extends State<IschoolerSideBar> {
  final _controller = SidebarXController(selectedIndex: 5, extended: true);

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
      const DashboardScreen<AdminRolesListCubit>(),
      const DashboardScreen<InstructorsListCubit>(),
      const DashboardScreen<InstructorAssignmentsListCubit>(),
      const DashboardScreen<StudentsListCubit>(),
      const DashboardScreen<ClassesListCubit>(),
      const DashboardScreen<GradesListCubit>(),
      const DashboardScreen<SubjectsListCubit>(),
      // const TimeTableScreen(),
      const DashboardScreen<StudentsListCubit>(),
      const DashboardScreen<StudentsListCubit>(),
      const DashboardScreen<HomeworksListCubit>(),
      const DashboardScreen<StudentsListCubit>(),
      const DashboardScreen<StudentsListCubit>(),

      // const SettingsTab(),
      const LanguagesScreen(),
      const EmptyTab(),
    ];
    return IschoolerScreen(
      // key: _key,
      // appBar: AppBar(backgroundColor: Colors.transparent),
      showAppbar: true,
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
