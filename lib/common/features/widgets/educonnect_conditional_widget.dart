import 'package:flutter/material.dart';

class EduconnectConditionalWidget extends StatelessWidget {
  final bool condition;
  final Widget whenTrue;
  final Widget whenFalse;
  const EduconnectConditionalWidget(
      {super.key,
      required this.condition,
      required this.whenTrue,
      required this.whenFalse});

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return whenTrue;
    } else {
      return whenFalse;
    }
  }
}
