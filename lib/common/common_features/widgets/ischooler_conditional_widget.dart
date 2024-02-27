import 'package:flutter/material.dart';

class IschoolerConditionalWidget extends StatelessWidget {
  final bool condition;
  final Widget? whenTrue;
  final Widget whenFalse;
  const IschoolerConditionalWidget({
    super.key,
    required this.condition,
    this.whenTrue,
    required this.whenFalse,
  });

  @override
  Widget build(BuildContext context) {
    if (condition && whenTrue != null) {
      return whenTrue!;
    } else {
      return whenFalse;
    }
  }
}
