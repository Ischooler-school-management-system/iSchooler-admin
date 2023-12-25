import 'package:flutter/material.dart';
import 'package:school_admin/common/app_constants.dart';

import '../../../common/features/widgets/mawjood_text_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(MawjoodConstants.localization().welcome_message),
            Text(MawjoodConstants.localization().),
            EduConnectTextField(labelText: 'Enter the name of admin'),
          ],
        ),
      ),
    );
  }
}
