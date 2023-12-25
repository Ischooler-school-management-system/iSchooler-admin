// ignore_for_file: public_member_api_docs, sort_constructors_first
library mawjood_button_library;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_constants.dart';
import '../../../style/mawjood_colors.dart';
import 'models/buttons_model.dart';
import 'models/mawjood_button_interface.dart';

part 'buttons_widgets/cart_button_widget.dart';
part 'buttons_widgets/elevated_button_widget.dart';
part 'buttons_widgets/elevated_button_with_icon_widget.dart';
part 'buttons_widgets/icon_button_widget.dart';
part 'buttons_widgets/mawjood_add_remove_button_widget.dart';
part 'buttons_widgets/text_button_widget.dart';

// Main button class that renders different button types based on the provided `button` object.
class MawjoodButton extends StatelessWidget {
  final IMawjoodButton button;

  const MawjoodButton({
    super.key,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    switch (button) {
      case MawjoodElevatedButton mawjoodElevatedButton:
        return _ElevatedButtonWidget(
            mawjoodElevatedButton: mawjoodElevatedButton);

      case MawjoodTextButton mawjoodTextButton:
        return _TextButtonWidget(mawjoodTextButton: mawjoodTextButton);

      case MawjoodIconButton mawjoodIconButton:
        return _IconButtonWidget(mawjoodIconButton: mawjoodIconButton);

      case MawjoodElevatedButtonWithIcon mawjoodElevatedButtonWithIcon:
        return _ElevatedButtonWithIconWidget(
            mawjoodElevatedButtonWithIcon: mawjoodElevatedButtonWithIcon);

      case MawjoodCartButton mawjoodCartButton:
        return _CartButtonWidget(mawjoodCartButton: mawjoodCartButton);

         case MawjoodAddRemoveButton mawjoodAddRemoveButton:
        return _MawjoodAddRemoveButtonWidget(mawjoodAddRemoveButton: mawjoodAddRemoveButton);

      default:
        return const Text('Nothing');
    }
  }
}
