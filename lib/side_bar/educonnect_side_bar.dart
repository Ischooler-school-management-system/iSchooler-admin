import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../common/style/educonnect_colors.dart';
import '../admin_features/users/admins/presentation/screens/all_admins_screen.dart';
import '../admin_features/users/students/presentation/screens/all_students_screen.dart';
import '../auth/settings/language/presentation/screens/languages_screen.dart';
import '../common/comon_features/widgets/educonnect_screen.dart';
import '../common/educonnect_constants.dart';
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
      const AllAdminsScreen(),
      const TeachersTab(),
      const AllStudentsScreen(),
      const ClassesTab(),
      const GradesTab(),
      const SubjectsTab(),
      const ExamsTab(),
      const TimetableTab(),
      const HomeworksTab(),
      const ProfileTab(),
      // const SettingsTab(),
      const LanguagesScreen(),
      const EmptyTab(),
    ];
    return EduconnectScreen(
      // key: _key,
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: Colors.transparent,
              // title: tabBodies[_controller.selectedIndex],
              /* leading: IconButton(
                onPressed: () {
                  // if (!Platform.isAndroid && !Platform.isIOS) {
                  //   _controller.setExtended(true);
                  // }
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ), */
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

class TeachersTab extends StatelessWidget {
  const TeachersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(EduconnectConstants.localization().classes);
  }
}

class ClassesTab extends StatelessWidget {
  const ClassesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(EduconnectConstants.localization().classes);
  }
}

class GradesTab extends StatelessWidget {
  const GradesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(EduconnectConstants.localization().grades);
  }
}

class SubjectsTab extends StatelessWidget {
  const SubjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(EduconnectConstants.localization().subjects);
  }
}

class ExamsTab extends StatelessWidget {
  const ExamsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(EduconnectConstants.localization().exams);
  }
}

class TimetableTab extends StatelessWidget {
  const TimetableTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(EduconnectConstants.localization().timetable);
  }
}

class HomeworksTab extends StatelessWidget {
  const HomeworksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(EduconnectConstants.localization().homeworks);
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(EduconnectConstants.localization().profile);
  }
}

class EmptyTab extends StatelessWidget {
  const EmptyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Empty Tab');
  }
}
