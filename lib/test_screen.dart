import 'package:flutter/material.dart';
import 'package:school_admin/common/madpoly.dart';

import 'common/comon_features/widgets/buttons/educonnect_button.dart';
import 'common/comon_features/widgets/buttons/models/buttons_model.dart';
import 'common/comon_features/widgets/educonnect_screen.dart';
import 'common/navigation/router.export.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'test_screen > ',
      developer: "Ziad",
    );
    return EduconnectScreen(
      keepMobileView: true,
      alignment: Alignment.center,
      body: Column(
        children: [
          EduconnectButton(
            button: EduconnectElevatedButton(
              onPressed: () => onPressed(context),
              text: 'text',
            ),
          ),
        ],
      ),
    );
  }

  onPressed(BuildContext context) {
    String textToPass = 'Hello from sroiensraoiensroinra!';
    EduconnectNavigator.push(Routes.test2Screen, arguments: textToPass);
  }
} // Add debug statements in Test2Screen

class Test2Screen extends StatelessWidget {
  const Test2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'test_screen > ',
      developer: "Ziad",
    );
    final currentAdminData = ModalRoute.of(context)?.settings.arguments;
    String receivedText = currentAdminData != null
        ? currentAdminData.toString()
        : 'No text received';

    print('Received text: $receivedText');

    return EduconnectScreen(
      keepMobileView: true,
      alignment: Alignment.center,
      body: Text(receivedText),
    );
  }

  onPressed() {}
}
