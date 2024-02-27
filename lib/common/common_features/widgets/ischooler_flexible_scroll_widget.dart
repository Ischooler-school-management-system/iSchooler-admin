import 'package:flutter/material.dart';

// class IschoolerScrollingWidget
class IschoolerFlexibleScrollWidget extends StatelessWidget {
  final Widget child;
  final bool hasMinHeight;
  final bool enableScrolling;
  final bool enableflexibleScrolling;
  const IschoolerFlexibleScrollWidget({
    super.key,
    required this.child,
    this.hasMinHeight = false,
    this.enableScrolling = false,
    this.enableflexibleScrolling = false,
  });

  @override
  Widget build(BuildContext context) {
    if (enableflexibleScrolling) {
      return LayoutBuilder(builder: (context, constraints) {
        // Enable scrolling within the screen
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight:
                  hasMinHeight ? constraints.minHeight : constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: SingleChildScrollView(child: child), // Build the body
            ),
          ),
        );
      });
    } else if (enableScrolling) {
      return SingleChildScrollView(
        child: child,
      );
    } else {
      return child;
    }
  }
}
/* 
MagicContainer(){
   return 
   
}
 */