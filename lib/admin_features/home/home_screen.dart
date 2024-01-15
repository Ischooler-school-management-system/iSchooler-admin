/* import 'package:flutter/material.dart';
import 'package:school_admin/common/style/educonnect_text_theme.dart';

import '../../common/admin_features/widgets/educonnect_screen.dart';
import '../../common/admin_features/widgets/responsive.dart';
import '../../side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      appBar: Responsive.isNotMobile()
          ? null
          : AppBar(
              // title: Text('t'),
              ),
      body: ResponsiveRow(
        body: body(),
        /* sideWiget: Container(
          color: Colors.red,
        ), */
      ),
      drawer: Responsive.isNotMobile() ? null : const SideMenu(),
    );
  }

  Center body() {
    return Center(
        child: Text(
      'data',
      style: EduconnectTextStyles.style20,
    ));
  }
}

class ResponsiveRow extends StatelessWidget {
  final Widget body;
  final Widget? sideWiget;

  const ResponsiveRow({
    super.key,
    required this.body,
    this.sideWiget,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile()
        ? body
        : Row(
            // children: Responsive.expandedChildren(
            // ratio: 3,
            children: [
              const SideMenu(),
              Expanded(child: body),
              if (sideWiget != null) SizedBox(width: 300, child: sideWiget),
            ],
          );
  }
}
 */