import 'package:flutter/material.dart';

import 'responsive.dart';

class ResponsiveDropDownRow extends StatelessWidget {
  final List<Widget> children;
  const ResponsiveDropDownRow({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile()) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: Responsive.expandedChildren(children: children),
      );
    }
  }
}
