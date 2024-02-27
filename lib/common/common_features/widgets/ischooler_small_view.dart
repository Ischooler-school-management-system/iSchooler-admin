import 'package:flutter/material.dart';

import '../../navigation/ischooler_navi.dart';

class IschoolerSmallView extends StatelessWidget {
  final bool keepMobileView;
  final Widget child;
  final bool isCenter;
  const IschoolerSmallView({
    super.key,
    this.keepMobileView = true,
    required this.child,
    this.isCenter = true,
  });

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(currentContext!).size.width < 400;
    final double maxWidth = isMobile ? double.infinity : 400;
    final BoxConstraints boxConstraints = BoxConstraints(maxWidth: maxWidth);

    return Container(
      alignment: isCenter ? Alignment.center : null,
      constraints: keepMobileView ? boxConstraints : null,
      child: child,
    );
  }
}

class IschoolerBoxConstrain extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final EdgeInsetsGeometry? padding;
  final bool roundedCorners;
  const IschoolerBoxConstrain({
    super.key,
    required this.child,
    this.maxWidth,
    this.padding,
    this.roundedCorners = true,
  });

  @override
  Widget build(BuildContext context) {
    final BoxConstraints boxConstraints =
        BoxConstraints(maxWidth: maxWidth ?? 400);

    return Container(
      alignment: Alignment.center,
      padding: padding,
      constraints: boxConstraints,
      decoration: BoxDecoration(
        borderRadius: roundedCorners ? BorderRadius.circular(120) : null,
      ),
      child: child,
    );
  }
}
