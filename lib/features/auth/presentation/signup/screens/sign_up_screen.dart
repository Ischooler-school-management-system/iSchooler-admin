import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/features/widgets/educonnect_screen.dart';
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
    return EduconnectScreen(
      isScrollable: true,
      body: Center(
        child: Column(
          children: [
            Visibility(
              visible: !isKeyboardOpen,
              child: AuthHeaderWidget(
                height: EduconnectConstants.educonnect_screen_height * 0.25,
                width: EduconnectConstants.educonnect_screen_width,
                title: EduconnectConstants.localization().welcome,
                subTitle: EduconnectConstants.localization().sign_up_prompt,
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
                    child: EduconnectButton(
                      button: EduconnectTextButton(
                        onPressed: onSigninButtonPressed,
                        textButton: EduconnectConstants.localization().sign_in,
                        leadingText: EduconnectConstants.localization()
                            .have_account_prompt,
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

  onIsKeyboardStatusChanged(newValue) {
    setState(() {
      isKeyboardOpen = newValue;
    });
  }
  onSigninButtonPressed() {
    EduconnectNavigator.push(Routes.signinScreen, replace: true);
  }

  List<Expanded> expandedChildren({required List<Widget> childern}) {
    return childern.map((e) => Expanded(child: e)).toList();
  }
}
