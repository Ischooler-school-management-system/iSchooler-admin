import 'package:flutter/material.dart';

import '../../navigation/educonnect_navi.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static double mobileWidth = 850;
  static double tabletWidth = 1100;

  static bool isMobile() =>
      MediaQuery.of(currentContext!).size.width < mobileWidth;

  static bool isCustomWidth({required double width}) {
    return MediaQuery.of(currentContext!).size.width < width;
  }

  /* static bool isTablet() =>
      MediaQuery.of(currentContext!).size.width < tabletWidth &&
      MediaQuery.of(currentContext!).size.width >= mobileWidth;

  static bool isDesktop() => MediaQuery.of(currentContext!).size.width >= tabletWidth; */

  static List<Expanded> expandedChildren(
      {required List<Widget> children, EdgeInsets? padding}) {
    return children.map((e) {
      return Expanded(child: Container(padding: padding, child: e));
    }).toList();
  }

  static List<Widget> childrenWithSpacing({
    required List<Widget> children,
    double? verticalSpacing,
    double? horizontalSpacing,
  }) {
    final space = SizedBox(width: horizontalSpacing, height: verticalSpacing);
    return children.expand((widget) => [widget, space]).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(currentContext!).size;
    // If our width is more than tabletWidth then we consider it a desktop
    /* if (size.width >= tabletWidth && desktop != null) {
      return desktop!;
    
    // If width it less then tabletWidth and more then mobileWidth we consider it as tablet
    else} */
    if (size.width >= mobileWidth && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
