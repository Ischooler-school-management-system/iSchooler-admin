import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/style/educonnect_text_theme.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../common/style/educonnect_colors.dart';
import '../auth/logic/cubit/auth_cubit.dart';
import '../common/comon_features/widgets/educonnect_icons.dart';
import '../common/educonnect_assets.dart';
import '../common/educonnect_constants.dart';

const primaryColor = canvasColor;
const canvasColor = EduconnectColors.blue;
const scaffoldBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
const accentCanvasColor = EduconnectColors.grey;
const white = Colors.white;
final divider = Divider(color: white.withOpacity(0.3), height: 1);
FirebaseAuth newVariable = FirebaseAuth.instance;

class ExampleSidebarX extends StatelessWidget {
  final SidebarXController _controller;
  const ExampleSidebarX({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  IconThemeData selectedIconTheme() {
    return const IconThemeData(
      color: Colors.white,
      size: 20,
    );
  }

  IconThemeData iconTheme() {
    return const IconThemeData(
      color: Colors.white,
      size: 20,
    );
  }

  BoxDecoration itemDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: canvasColor),
    );
  }

  BoxDecoration selectedItemDecoration() {
    return BoxDecoration(
      color: white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: const Color.fromARGB(137, 198, 195, 195).withOpacity(0.37),
      ),
      /* gradient: const LinearGradient(
          colors: [accentCanvasColor, canvasColor],
        ), */
    );
  }

  Widget headerBuilder(context, extended) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(EduconnectAssets.blankProfileImage),
          ),
        ),
        if (newVariable.currentUser != null &&
            newVariable.currentUser!.email != null)
          Text(newVariable.currentUser!.email!,
              style: EduconnectTextStyles.style14White),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const itemTextPadding = EdgeInsets.symmetric(horizontal: 30);
    final List<SidebarXItem> sideBarTabs = [
      // SidebarXItem(
      //   icon: const tterLogo(size: 20),
      //   label: EduconnectConstants.localization().dashboard,
      // ),
      SidebarXItem(
        icon: Icons.admin_panel_settings,
        label: EduconnectConstants.localization().admins,
      ),
      const SidebarXItem(
        icon: Icons.admin_panel_settings,
        // label: EduconnectConstants.localization().admins_roles,
        label: 'Admins Roles',
      ),
      SidebarXItem(
        icon: EduconnectIcons.teacher_7,
        label: EduconnectConstants.localization().teachers,
      ),
      const SidebarXItem(
        icon: EduconnectIcons.teacher_7,
        label: 'Instructor Assignment',
      ),
      SidebarXItem(
        icon: Icons.person,
        label: EduconnectConstants.localization().students,
      ),
      SidebarXItem(
        icon: (Icons.school),
        label: EduconnectConstants.localization().classes,
      ),
      SidebarXItem(
        icon: (Icons.grade),
        label: EduconnectConstants.localization().grades,
      ),
      SidebarXItem(
        icon: (Icons.subject),
        label: EduconnectConstants.localization().subjects,
      ),
      SidebarXItem(
        icon: (Icons.schedule),
        label: EduconnectConstants.localization().timetable,
      ),
      SidebarXItem(
        icon: (Icons.assignment),
        label: EduconnectConstants.localization().exams,
      ),

      SidebarXItem(
        icon: (Icons.assignment_turned_in),
        label: EduconnectConstants.localization().homeworks,
      ),

      SidebarXItem(
        icon: (Icons.account_circle),
        label: EduconnectConstants.localization().profile,
      ),
      SidebarXItem(
        icon: (Icons.settings),
        label: EduconnectConstants.localization().settings,
      ),
      SidebarXItem(
        icon: Icons.logout,
        label: EduconnectConstants.localization().sign_out,
        onTap: () {
          context.read<AuthCubit>().signOut();
        },
      )
    ];
    final SidebarXTheme sidebarXTheme = SidebarXTheme(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: canvasColor,
        borderRadius: BorderRadius.circular(20),
      ),
      hoverColor: white.withOpacity(0.5),
      textStyle: const TextStyle(color: Colors.white),
      selectedTextStyle: const TextStyle(color: Colors.white),
      itemTextPadding: itemTextPadding,
      selectedItemTextPadding: itemTextPadding,
      itemDecoration: itemDecoration(),
      selectedItemDecoration: selectedItemDecoration(),
      iconTheme: iconTheme(),
      selectedIconTheme: selectedIconTheme(),
    );
    const SidebarXTheme extendedTheme = SidebarXTheme(
      width: 250,
      decoration: BoxDecoration(
        color: canvasColor,
      ),
    );

    return SidebarX(
      controller: _controller,
      theme: sidebarXTheme,
      extendedTheme: extendedTheme,
      footerDivider: divider,
      headerBuilder: headerBuilder,
      items: sideBarTabs,
    );
  }
}
