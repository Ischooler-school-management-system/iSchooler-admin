import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../../admin_features/users/user_model.dart';
import '../../../../common/navigation/router.export.dart';
import '../../auth/widgets/auth_header_widget.dart';
import '../widgets/signup_password_form.dart';

class SignupPasswordScreen extends StatefulWidget {
  // final UserModel newUser;
  const SignupPasswordScreen({
    super.key,
    // required this.newUser,
  });

  @override
  State<SignupPasswordScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupPasswordScreen> {
  bool isKeyboardOpen = false;

  @override
  Widget build(BuildContext context) {
    final UserModel newUser = EduconnectNavigator.getPassedData(context,
        defaultValue: UserModel.empty()) as UserModel;
    return EduconnectScreen(
      enableflexibleScrolling: true,
      alignment: Alignment.center,
      keepMobileView: true,
      body: Center(
        child: Column(
          children: [
            Visibility(
              visible: !isKeyboardOpen,
              child: AuthHeaderWidget(
                height: EduconnectConstants.educonnect_screen_height * 0.25,
                width: EduconnectConstants.educonnect_screen_width,
                title: 'Create Password',
                subTitle: 'Create a password so you can login to your account',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0.h),
              child: Column(
                children: [
                  SignupPasswordForm(
                    onIsKeyboardStatusChanged: onIsKeyboardStatusChanged,
                    newUser: newUser,
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
}
