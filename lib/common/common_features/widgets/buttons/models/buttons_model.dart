import 'package:flutter/material.dart';

import 'ischooler_button_interface.dart';

//
class IschoolerElevatedButton extends IIschoolerButton {
  final String text;
  final bool isLightMode;
  final double? width;
  final double? height;
  final bool hasRoundedCorners;
  final TextStyle? textStyle;
  final double? radius;
  final EdgeInsetsGeometry? textPadding;
  final OutlinedBorder? shape;

  const IschoolerElevatedButton({
    required super.onPressed,
    super.disabled,
    required this.text,
    this.isLightMode = false,
    this.hasRoundedCorners = true,
    this.width,
    this.height,
    this.textStyle,
    this.radius,
    this.textPadding,
    this.shape,
  });
}

class IschoolerTextButton extends IIschoolerButton {
  final String? leadingText;
  final String textButton;
  final Color? color;
  final bool hasUnderline;
  final TextStyle? style;
  final Widget? widget;
  //final BuildContext context;

  const IschoolerTextButton({
    this.leadingText,
    required super.onPressed,
    required this.textButton,
    this.color,
    this.hasUnderline = false,
    this.style,
    this.widget,
    super.disabled,
    //required this.context,
  });
}

class IschoolerContainerButton extends IIschoolerButton {
  final Widget child;
  final bool roundedCorners;
  final Color? color;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const IschoolerContainerButton({
    required this.child,
    required super.onPressed,
    this.roundedCorners = false,
    this.color,
    this.borderRadius,
    this.margin,
    this.padding,
  });
}

class IschoolerIconButton extends IIschoolerButton {
  final Widget icon;
  final Color? color;
  final bool isLightMode;
  final bool hasBorder;
  final double? width;
  final double? height;
  final bool isContainer;

  const IschoolerIconButton({
    this.isContainer = false,
    required super.onPressed,
    required this.icon,
    this.isLightMode = false,
    this.hasBorder = true,
    this.width,
    this.height,
    this.color,
    super.disabled,
  });
}

class IschoolerElevatedButtonWithIcon extends IIschoolerButton {
  final Widget icon;
  final String text;
  final bool leftIcon;
  final bool isLightMode;

  const IschoolerElevatedButtonWithIcon({
    required this.icon,
    required super.onPressed,
    required this.text,
    this.leftIcon = false,
    this.isLightMode = true,
    super.disabled,
  });
}

class IschoolerCartButton extends IIschoolerButton {
  final String text;
  final dynamic Function()? addOnPressed;
  final dynamic Function()? removeOnPressed;

  const IschoolerCartButton({
    this.addOnPressed,
    this.removeOnPressed,
    required super.onPressed,
    required this.text,
    super.disabled,
  });
}

class IschoolerAddRemoveButton extends IIschoolerButton {
  final dynamic Function() addButtonFunction;
  final dynamic Function() subtractButtonFunction;
  final int count;

  const IschoolerAddRemoveButton({
    required this.count,
    required this.addButtonFunction,
    required this.subtractButtonFunction,
    required super.onPressed,
    super.disabled,
  });
}
