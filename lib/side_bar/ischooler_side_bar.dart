import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../common/style/ischooler_colors.dart';
import '../common/common_features/widgets/ischooler_screen.dart';
import '../common/madpoly.dart';
import 'ischooler_side_bar_data.dart';
import 'sidebar_x.dart';

const primaryColor = canvasColor;
const canvasColor = Color.fromARGB(255, 144, 190, 215);
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
  final _controller = SidebarXController(selectedIndex: 8, extended: true);

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'ischooler_side_bar > build',
      developer: "Ziad",
    );
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return IschoolerScreen(
      showAppBar: true,
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return IschoolerSideBarData.sideBarData.keys
                    .toList()[_controller.selectedIndex];
              },
            ),
          ),
        ],
      ),
    );
  }
}
