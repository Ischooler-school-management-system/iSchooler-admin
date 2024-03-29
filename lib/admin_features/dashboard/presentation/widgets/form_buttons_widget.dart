// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../../common/common_features/responsive/responsive.dart';
import '../../../../common/common_features/widgets/buttons/ischooler_button_export.dart';
import '../../../../common/navigation/router.export.dart';

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
        IschoolerButton(
          button: IschoolerElevatedButton(
            // width: 200,
            onPressed: () {
              // SmartDialog.dismiss();
              IschoolerNavigator.pop();
            },
            text: 'cancel',
          ),
        ),
        IschoolerButton(
          button: IschoolerElevatedButton(
            // width: 200,
            onPressed: onSubmitButtonPressed,
            text: 'Submit',
          ),
        ),
      ],
    ));
  }
}
