// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:school_admin/common/comon_features/responsive/responsive.dart';
import 'package:school_admin/common/comon_features/widgets/buttons/educonnect_button_export.dart';

class FormButtonsWidget extends StatelessWidget {
  final Function()? onSubmitButtonPressed;
  const FormButtonsWidget({
    super.key,
    this.onSubmitButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: Responsive.expandedChildren(
      padding: const EdgeInsets.all(8),
      children: [
        EduconnectButton(
          button: EduconnectElevatedButton(
            // width: 200,
            onPressed: () {
              SmartDialog.dismiss();
            },
            text: 'cancel',
          ),
        ),
        EduconnectButton(
          button: EduconnectElevatedButton(
            // width: 200,
            onPressed: onSubmitButtonPressed,
            text: 'Submit',
          ),
        ),
      ],
    ));
  }
}
