// ignore_for_file: public_member_api_docs, sort_constructors_first
library educonnect_button_library;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../educonnect_constants.dart';
import '../../../style/educonnect_colors.dart';
import '../../../style/educonnect_text_theme.dart';
import 'models/buttons_model.dart';
import 'models/educonnect_button_interface.dart';

part 'buttons_widgets/cart_button_widget.dart';
part 'buttons_widgets/educonnect_add_remove_button_widget.dart';
part 'buttons_widgets/elevated_button_widget.dart';
part 'buttons_widgets/elevated_button_with_icon_widget.dart';
part 'buttons_widgets/icon_button_widget.dart';
part 'buttons_widgets/text_button_widget.dart';
part 'buttons_widgets/container_button_widget.dart';

// lib/common/features/widgets/buttons/buttons_widgets/container_button_widget.dart
// lib/common/features/widgets/buttons/buttons_widgets/elevated_button_with_icon_widget.dart
// Main button class that renders different button types based on the provided `button` object.
class EduconnectButton extends StatelessWidget {
  final IEduconnectButton button;

  const EduconnectButton({
    super.key,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    switch (button) {
      case EduconnectElevatedButton educonnectElevatedButton:
        return _ElevatedButtonWidget(
            educonnectElevatedButton: educonnectElevatedButton);

      case EduconnectTextButton educonnectTextButton:
        return _TextButtonWidget(educonnectTextButton: educonnectTextButton);

      case EduconnectIconButton educonnectIconButton:
        return _IconButtonWidget(educonnectIconButton: educonnectIconButton);

      case EduconnectElevatedButtonWithIcon educonnectElevatedButtonWithIcon:
        return _ElevatedButtonWithIconWidget(
            educonnectElevatedButtonWithIcon: educonnectElevatedButtonWithIcon);

      case EduconnectCartButton educonnectCartButton:
        return _CartButtonWidget(educonnectCartButton: educonnectCartButton);

      case EduconnectAddRemoveButton educonnectAddRemoveButton:
        return _EduconnectAddRemoveButtonWidget(
            educonnectAddRemoveButton: educonnectAddRemoveButton);
      case EduconnectContainerButton educonnectContainerButton:
        return _EduconnectContainerButtonWidget(
          educonnectContainerButton: educonnectContainerButton,
        );

      default:
        return const Text('Nothing');
    }
  }
}
