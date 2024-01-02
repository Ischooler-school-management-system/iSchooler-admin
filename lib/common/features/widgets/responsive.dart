import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  static bool isMobile() => MediaQuery.of(currentContext!).size.width < 850;

  static bool isTablet() =>
      MediaQuery.of(currentContext!).size.width < 1100 &&
      MediaQuery.of(currentContext!).size.width >= 850;

  static bool isDesktop() => MediaQuery.of(currentContext!).size.width >= 1100;
  static double responsiveFontSize(double size) {
    var responsiveSize = isMobile() ? size : size / 2;
    return responsiveSize.sp;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(currentContext!).size;
    // If our width is more than 1100 then we consider it a desktop
    /* if (size.width >= 1100 && desktop != null) {
      return desktop!;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else */ if (size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
