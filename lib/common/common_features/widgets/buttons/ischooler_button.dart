// ignore_for_file: public_member_api_docs, sort_constructors_first
library educonnect_button_library;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ischooler_constants.dart';
import '../../../style/ischooler_colors.dart';
import '../../../style/ischooler_text_theme.dart';
import 'models/buttons_model.dart';
import 'models/ischooler_button_interface.dart';

part 'buttons_widgets/cart_button_widget.dart';
part 'buttons_widgets/ischooler_add_remove_button_widget.dart';
part 'buttons_widgets/elevated_button_widget.dart';
part 'buttons_widgets/elevated_button_with_icon_widget.dart';
part 'buttons_widgets/icon_button_widget.dart';
part 'buttons_widgets/text_button_widget.dart';
part 'buttons_widgets/container_button_widget.dart';

// lib/common/admin_features/widgets/buttons/buttons_widgets/container_button_widget.dart
// lib/common/admin_features/widgets/buttons/buttons_widgets/elevated_button_with_icon_widget.dart
// Main button class that renders different button types based on the provided `button` object.
class IschoolerButton extends StatelessWidget {
  final IIschoolerButton button;

  const IschoolerButton({
    super.key,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    switch (button) {
      case IschoolerElevatedButton educonnectElevatedButton:
        return _ElevatedButtonWidget(
            educonnectElevatedButton: educonnectElevatedButton);

      case IschoolerTextButton educonnectTextButton:
        return _TextButtonWidget(educonnectTextButton: educonnectTextButton);

      case IschoolerIconButton educonnectIconButton:
        return _IconButtonWidget(educonnectIconButton: educonnectIconButton);

      case IschoolerElevatedButtonWithIcon educonnectElevatedButtonWithIcon:
        return _ElevatedButtonWithIconWidget(
            educonnectElevatedButtonWithIcon: educonnectElevatedButtonWithIcon);

      case IschoolerCartButton educonnectCartButton:
        return _CartButtonWidget(educonnectCartButton: educonnectCartButton);

      case IschoolerAddRemoveButton educonnectAddRemoveButton:
        return _IschoolerAddRemoveButtonWidget(
            educonnectAddRemoveButton: educonnectAddRemoveButton);
      case IschoolerContainerButton educonnectContainerButton:
        return _IschoolerContainerButtonWidget(
          educonnectContainerButton: educonnectContainerButton,
        );

      default:
        return const Text('Nothing');
    }
  }
}
