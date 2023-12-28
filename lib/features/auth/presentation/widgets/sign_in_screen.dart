import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_constants.dart';
import '../../../../common/features/widgets/buttons/educonnect_button_export.dart';
import '../../../../common/features/widgets/educonnect_text_field.dart';
import '../widgets/auth_header_widget.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AuthHeaderWidget(
              height: EduConnectConstants.educonnect_screen_height * 0.25,
              width: EduConnectConstants.educonnect_screen_width,
              title: 'Welcome',
              subTitle: 'Sign in and get started',
            ),
            Column(
              children: [
                EduConnectTextField(
                  labelText:
                      EduConnectConstants.localization().enter_admin_name,
                ),
                EduConnectTextField(
                  labelText:
                      EduConnectConstants.localization().enter_school_name,
                ),
                EduConnectTextField(
                  labelText:
                      EduConnectConstants.localization().enter_school_email,
                ),
                SizedBox(height: 20.h),
                EduconnectButton(
                    button: EduconnectElevatedButton(
                  onPressed: () {},
                  text: EduConnectConstants.localization().next,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
