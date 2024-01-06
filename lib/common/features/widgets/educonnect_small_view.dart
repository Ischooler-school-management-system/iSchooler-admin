import 'package:flutter/material.dart';

import '../../navigation/educonnect_navi.dart';

class EduconnectSmallView extends StatelessWidget {
  final bool keepMobileView;
  final Widget child;
  const EduconnectSmallView({
    super.key,
    required this.keepMobileView,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(currentContext!).size.width < 400;
    final double maxWidth = isMobile ? double.infinity : 400;
    final BoxConstraints boxConstraints = BoxConstraints(maxWidth: maxWidth);

    return Container(
      alignment: Alignment.center,
      constraints: keepMobileView ? boxConstraints : null,
      child: child,
    );
  }
}
