import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/features/widgets/educonnect_screen.dart';
import '../../../../../common/navigation/router.export.dart';
import '../../../../../common/style/educonnect_colors.dart';
import '../../auth/widgets/auth_header_widget.dart';
import '../widgets/signin_form.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool isKeyboardOpen = false;
  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      keepMobileView: true,
      alignment: Alignment.center,
      enableflexibleScrolling: true,
      body: Center(
        child: Column(
          children: [
            /// show and hide AuthHeaderWidget widget depending on the keyboard state
            Visibility(
              visible: !isKeyboardOpen,
              child: AuthHeaderWidget(
                height: EduconnectConstants.educonnect_screen_height * 0.25,
                width: EduconnectConstants.educonnect_screen_width,
                title: EduconnectConstants.localization().welcome,
                subTitle: EduconnectConstants.localization().sign_in_prompt,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0.h),
              child: Column(
                children: [
                  SigninForm(
                    onIsKeyboardOpenChanged: (bool value) {
                      isKeyboardOpen = value;
                    },
                  ),

                  // Spacer(),
                  SizedBox(height: 20.h),

                  /// show and hide signup button depending on the keyboard state
                  Visibility(
                    visible: !isKeyboardOpen,
                    child: EduconnectButton(
                      button: EduconnectTextButton(
                        onPressed: onSignupButtonPressed,
                        textButton: EduconnectConstants.localization().sign_up,
                        leadingText: EduconnectConstants.localization()
                            .no_account_prompt,
                        color: EduconnectColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onSignupButtonPressed() {
    EduconnectNavigator.push(Routes.signupScreen, replace: true);
  }
}
