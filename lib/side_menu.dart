import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

class EduconnectSideMenu extends StatefulWidget {
  const EduconnectSideMenu({super.key});

  @override
  State<EduconnectSideMenu> createState() => _EduconnectSideMenuState();
}

class _EduconnectSideMenuState extends State<EduconnectSideMenu> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SideMenuStyle sideMenuStyle = SideMenuStyle(
      // showTooltip: false,
      displayMode: SideMenuDisplayMode.auto,
      hoverColor: Colors.blue[100],
      selectedHoverColor: Colors.blue[100],
      selectedColor: Colors.lightBlue,
      selectedTitleTextStyle: const TextStyle(color: Colors.white),
      selectedIconColor: Colors.white,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      // ),
      // backgroundColor: Colors.blueGrey[700]
    );
    final List<SideMenuItem> sideMenuItems = [
      SideMenuItem(
        title: 'Dashboard',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.home),
        badgeContent: const Text(
          '3',
          style: TextStyle(color: Colors.white),
        ),
        tooltipContent: "This is a tooltip for Dashboard item",
      ),
      SideMenuItem(
        title: 'Users',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.supervisor_account),
      ),
      SideMenuItem(
        title: 'Files',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.file_copy_rounded),
        trailing: Container(
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
              child: Text(
                'New',
                style: TextStyle(fontSize: 11, color: Colors.grey[800]),
              ),
            )),
      ),
      SideMenuItem(
        title: 'Download',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.download),
      ),
      SideMenuItem(
        builder: (context, displayMode) {
          return const Divider(
            endIndent: 8,
            indent: 8,
          );
        },
      ),
      SideMenuItem(
        title: 'Settings',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.settings),
      ),
      // SideMenuItem(
      //   onTap:(index, _){
      //     sideMenu.changePage(index);
      //   },
      //   icon: const Icon(Icons.image_rounded),
      // ),
      // SideMenuItem(
      //   title: 'Only Title',
      //   onTap:(index, _){
      //     sideMenu.changePage(index);
      //   },
      // ),
      const SideMenuItem(
        title: 'Exit',
        icon: Icon(Icons.exit_to_app),
      ),
    ];
    return SideMenu(
      // alwaysShowFooter:true,
      collapseWidth: 200,
      controller: sideMenu,
      style: sideMenuStyle,
      title: Column(
        children: [
          ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 150,
                maxWidth: 150,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              )),
          const Divider(
            indent: 8.0,
            endIndent: 8.0,
          ),
        ],
      ),
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.lightBlue[100],
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Text(
              'mohada',
              style: TextStyle(fontSize: 15, color: Colors.grey[800]),
            ),
          ),
        ),
      ),
      items: sideMenuItems,
    );
  }
}
