import 'package:flutter/material.dart';

import '../../common/features/widgets/responsive.dart';
import '../../side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('app'),
      ),
      body: Responsive(
        mobile: body(),
        tablet: Row(
          children: [
            const EduconnectSideMenu(),
            body(),
          ],
        ),
      ),
      drawer: Responsive.isMobile()
          ? const Drawer(child: EduconnectSideMenu())
          : null,
    );
  }

  Center body() {
    return const Center(
      child: Text('text'),
    );
  }
}
