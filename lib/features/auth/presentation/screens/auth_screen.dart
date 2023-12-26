import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_constants.dart';
import '../../../../common/features/widgets/buttons/educonnect_button_export.dart';
import '../../../../common/features/widgets/educonnect_text_field.dart';
import '../widgets/auth_header_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
            /* Text(
              EduConnectConstants.localization().welcome_create_account,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff4F4F4F)),
            ), */
            // ),
            /* Padding(
              padding: EdgeInsets.symmetric(
                vertical: EduConnectConstants.mawjood_button_height * 0.1,
                horizontal: EduConnectConstants.mawjood_screen_width * 0.35,
              ),
              child: */
            Column(
              children: [
                /* Text(
                  EduConnectConstants.localization().welcome_message,
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff667085),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h), */
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
                MawjoodButton(
                    button: MawjoodElevatedButton(
                  onPressed: () {},
                  text: EduConnectConstants.localization().next,
                ))
              ],
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
