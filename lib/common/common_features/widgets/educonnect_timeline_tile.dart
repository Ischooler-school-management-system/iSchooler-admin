import 'package:flutter/material.dart';
import 'package:school_admin/common/style/educonnect_colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EduconnectTimelineTile extends StatelessWidget {
  final bool hasIndicator;
  final Widget? endChild;
  final Widget? startChild;
  final bool isFirst;
  final bool isLast;
  const EduconnectTimelineTile({
    super.key,
    this.hasIndicator = true,
    this.isFirst = false,
    this.isLast = false,
    this.endChild,
    this.startChild,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      hasIndicator: hasIndicator,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle:
          const IndicatorStyle(width: 10, color: EduconnectColors.blue),
      beforeLineStyle: const LineStyle(color: EduconnectColors.blue),
      alignment: TimelineAlign.manual,
      lineXY: 0.2,
      endChild: endChild,
      startChild: startChild,
    );
  }
}
