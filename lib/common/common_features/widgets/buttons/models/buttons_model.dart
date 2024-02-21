import 'package:flutter/material.dart';

import 'educonnect_button_interface.dart';

//
class EduconnectElevatedButton extends IEduconnectButton {
  final String text;
  final bool isLightMode;
  final double? width;
  final double? height;
  final bool hasRoundedCorners;
  final TextStyle? textStyle;
  final double? radius;
  final EdgeInsetsGeometry? textPadding;
  final OutlinedBorder? shape;

  const EduconnectElevatedButton({
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

class EduconnectTextButton extends IEduconnectButton {
  final String? leadingText;
  final String textButton;
  final Color? color;
  final bool hasUnderline;
  final TextStyle? style;
  final Widget? widget;
  //final BuildContext context;

  const EduconnectTextButton({
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

class EduconnectContainerButton extends IEduconnectButton {
  final Widget child;
  final bool roundedCorners;
  final Color? color;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const EduconnectContainerButton({
    required this.child,
    required super.onPressed,
    this.roundedCorners = false,
    this.color,
    this.borderRadius,
    this.margin,
    this.padding,
  });
}

class EduconnectIconButton extends IEduconnectButton {
  final Widget icon;
  final Color? color;
  final bool isLightMode;
  final bool hasBorder;
  final double? width;
  final double? height;
  final bool isContainer;

  const EduconnectIconButton({
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

class EduconnectElevatedButtonWithIcon extends IEduconnectButton {
  final Widget icon;
  final String text;
  final bool leftIcon;
  final bool isLightMode;

  const EduconnectElevatedButtonWithIcon({
    required this.icon,
    required super.onPressed,
    required this.text,
    this.leftIcon = false,
    this.isLightMode = true,
    super.disabled,
  });
}

class EduconnectCartButton extends IEduconnectButton {
  final String text;
  final dynamic Function()? addOnPressed;
  final dynamic Function()? removeOnPressed;

  const EduconnectCartButton({
    this.addOnPressed,
    this.removeOnPressed,
    required super.onPressed,
    required this.text,
    super.disabled,
  });
}

class EduconnectAddRemoveButton extends IEduconnectButton {
  final dynamic Function() addButtonFunction;
  final dynamic Function() subtractButtonFunction;
  final int count;

  const EduconnectAddRemoveButton({
    required this.count,
    required this.addButtonFunction,
    required this.subtractButtonFunction,
    required super.onPressed,
    super.disabled,
  });
}
