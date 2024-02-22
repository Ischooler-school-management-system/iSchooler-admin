import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/common_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/common_features/widgets/educonnect_screen.dart';
import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/navigation/router.export.dart';
import '../../../../../common/style/educonnect_colors.dart';
import '../../auth/widgets/auth_header_widget.dart';
import '../widgets/signup_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isKeyboardOpen = false;

  @override
  Widget build(BuildContext context) {
    return IschoolerScreen(
      alignment: Alignment.center,
      enableflexibleScrolling: true,
      keepMobileView: true,
      body: Center(
        child: Column(
          children: [
            Visibility(
              visible: !isKeyboardOpen,
              child: AuthHeaderWidget(
                height: IschoolerConstants.educonnect_screen_height * 0.25,
                width: IschoolerConstants.educonnect_screen_width,
                title: IschoolerConstants.localization().welcome,
                subTitle: IschoolerConstants.localization().sign_up_prompt,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0.h),
              child: Column(
                children: [
                  SignupForm(
                    onIsKeyboardStatusChanged: onIsKeyboardStatusChanged,
                  ),
                  SizedBox(height: 20.h),
                  Visibility(
                    visible: !isKeyboardOpen,
                    child: IschoolerButton(
                      button: IschoolerTextButton(
                        onPressed: onSigninButtonPressed,
                        textButton: IschoolerConstants.localization().sign_in,
                        leadingText: IschoolerConstants.localization()
                            .have_account_prompt,
                        color: IschoolerColors.primaryColor,
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

  onIsKeyboardStatusChanged(newValue) {
    setState(() {
      isKeyboardOpen = newValue;
    });
  }

  onSigninButtonPressed() {
    IschoolerNavigator.push(Routes.signinScreen, replace: true);
  }
}
