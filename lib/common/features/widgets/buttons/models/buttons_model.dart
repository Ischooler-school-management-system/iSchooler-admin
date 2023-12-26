import 'package:flutter/material.dart';

import 'educonnect_button_interface.dart';

class MawjoodElevatedButton extends IMawjoodButton {
  final String text;
  final bool isLightMode;
  final double? width;
  final double? height;
  final bool hasRoundedCorners;
  final TextStyle? textStyle;
  final double? radius;
  final EdgeInsetsGeometry? textPadding;
  final OutlinedBorder? shape;

  const MawjoodElevatedButton({
    required super.onPressed,
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

class MawjoodTextButton extends IMawjoodButton {
  final String? leadingText;
  final String textButton;
  final Color? color;
  final bool hasUnderline;
  final TextStyle? style;
  final Widget? widget;
  //final BuildContext context;

  const MawjoodTextButton( {
    this.leadingText,
    required super.onPressed,
    required this.textButton,
    this.color,
    this.hasUnderline = true,
    this.style,
    this.widget,
    //required this.context,
  });
}

class MawjoodIconButton extends IMawjoodButton {
  final Widget icon;
  final Color? color;
  final bool isLightMode;
  final bool hasBorder;
  final double? width;
  final double? height;

  const MawjoodIconButton({
    required super.onPressed,
    required this.icon,
    this.isLightMode = false,
    this.hasBorder = true,
    this.width,
    this.height,
    this.color,
  });
}

class MawjoodElevatedButtonWithIcon extends IMawjoodButton {
  final Widget icon;
  final String text;
  final bool leftIcon;
  final bool isLightMode;

  const MawjoodElevatedButtonWithIcon({
    required this.icon,
    required super.onPressed,
    required this.text,
    this.leftIcon = false,
    this.isLightMode = true,
  });
}

class MawjoodCartButton extends IMawjoodButton {
  final String text;
  final dynamic Function()? addOnPressed;
  final dynamic Function()? removeOnPressed;

  const MawjoodCartButton({
    this.addOnPressed,
    this.removeOnPressed,
    required super.onPressed,
    required this.text,
  });
}

class MawjoodAddRemoveButton extends IMawjoodButton {
   final dynamic Function() addButtonFunction;
  final dynamic Function() subtractButtonFunction;
  final int count;

  const MawjoodAddRemoveButton({required this.count,
   required this.addButtonFunction,required this.subtractButtonFunction,
    required super.onPressed,
});
}