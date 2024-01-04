import 'package:flutter/material.dart';
import 'package:school_admin/common/educonnect_constants.dart';

import '../../common/style/educonnect_colors.dart';
import '../../common/style/educonnect_text_theme.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List<StatelessWidget> drawerChildren = [
      DrawerHeader(
        child: Center(
          child: ListTile(
            leading: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                  color: Colors.red, shape: BoxShape.circle),
            ),
            title: Text('surya', style: EduconnectTextStyles.style20White),
            subtitle: Text(EduconnectConstants.localization().profile,
                style: EduconnectTextStyles.style14White),
          ),
        ),
      ),
      /*   DrawerListTile(
        title: EduconnectConstants.localization().dashboard,
        press: () {},
      ), */
      DrawerListTile(
        title: EduconnectConstants.localization().users,
        icon: Icons.person, // Placeholder for icon
        press: () {},
      ),
      DrawerListTile(
        title: EduconnectConstants.localization().classes,
        icon: Icons.school, // Placeholder for icon
        press: () {},
      ),
      DrawerListTile(
        title: EduconnectConstants.localization().grades,
        icon: Icons.grade, // Placeholder for icon
        press: () {},
      ),
      DrawerListTile(
        title: EduconnectConstants.localization().subjects,
        icon: Icons.subject, // Placeholder for icon
        press: () {},
      ),
      DrawerListTile(
        title: EduconnectConstants.localization().exams,
        icon: Icons.assignment, // Placeholder for icon
        press: () {},
      ),
      DrawerListTile(
        title: EduconnectConstants.localization().timetable,
        icon: Icons.schedule, // Placeholder for icon
        press: () {},
      ),
      DrawerListTile(
        title: EduconnectConstants.localization().homeworks,
        icon: Icons.assignment_turned_in, // Placeholder for icon
        press: () {},
      ),
      DrawerListTile(
        title: EduconnectConstants.localization().profile,
        icon: Icons.account_circle, // Placeholder for icon
        press: () {},
      ),
      DrawerListTile(
        title: EduconnectConstants.localization().settings,
        icon: Icons.settings, // Placeholder for icon
        press: () {},
      ),
    ];
    return Drawer(
      backgroundColor: EduconnectColors.blue,
      child: ListView(
        children: drawerChildren,
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  // final String title, svgSrc;
  final VoidCallback press;
  final String title;
  final IconData icon;
  const DrawerListTile({
    super.key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: EduconnectColors.white,
        size: 16,
      ),
      /*  leading: SvgPicture.asset(
        // svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ), */
      title: Text(
        title,
        style: const TextStyle(color: EduconnectColors.white),
      ),
    );
  }
}
