import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../common/style/ischooler_colors.dart';
import '../common/ischooler_assets.dart';
import 'ischooler_side_bar_data.dart';

const primaryColor = canvasColor;
const canvasColor = IschoolerColors.blue;
const scaffoldBackgroundColor = Color.fromRGBO(255, 255, 255, 1);
const accentCanvasColor = IschoolerColors.grey;
const white = Colors.white;
final Widget divider = Divider(color: white.withOpacity(0.3), height: 1);

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
            child: Image.asset(IschoolerAssets.blankProfileImage),
          ),
        ),
        // if (newVariable.currentUser != null &&
        //     newVariable.currentUser!.email != null)
        //   Text(newVariable.currentUser!.email!,
        //       style: IschoolerTextStyles.style14White),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const itemTextPadding = EdgeInsets.symmetric(horizontal: 30);
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
      // separatorBuilder: (BuildContext context, int i) => divider,
      items: IschoolerSideBarData.sideBarData.values.toList(),

      // footerItems: [
      //   SidebarXItem(
      //     icon: Icons.logout,
      //     label: IschoolerConstants.localization().sign_out,
      //     onTap: () {
      //       context.read<AuthCubit>().signOut();
      //     },
      //   )
      // ],
    );
  }
}
