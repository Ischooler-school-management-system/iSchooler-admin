import 'package:flutter/material.dart';

import 'responsive.dart';

class ResponsiveColumn extends StatelessWidget {
  final List<Widget> children;
  final Widget child;
  final CrossAxisAlignment? crossAxisAlignment;
  const ResponsiveColumn({
    super.key,
    required this.children,
    this.crossAxisAlignment,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    /*   var child = Container(
      width: 200,
      color: IschoolerColors.blue,
    ); */
    List<Widget> evenIndexList = [];
    List<Widget> oddIndexList = [];

    for (int i = 0; i < children.length; i++) {
      if (i % 2 == 0) {
        // Even index
        evenIndexList.add(children[i]);
      } else {
        // Odd index
        oddIndexList.add(children[i]);
      }
    }

    if (Responsive.isMobile()) {
      return Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [...children, child],
      );
    } else {
      return Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          Row(
            children: Responsive.expandedChildren(
              children: [
                Column(children: evenIndexList),
                Column(children: oddIndexList),
              ],
            ),
          ),
          child,
        ],
      );
    }
  }
}
