import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/educonnect_assets.dart';
import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/features/widgets/buttons/educonnect_button.dart';
import '../../../../../common/features/widgets/buttons/models/buttons_model.dart';
import '../../../../../common/features/widgets/educonnect_image_widget.dart';
import '../../../../../common/features/widgets/educonnect_screen.dart';
import '../../../../../common/navigation/router.export.dart';
import '../../../../../common/style/educonnect_text_theme.dart';
import '../../../logic/cubit/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      keepMobileView: true,
      body:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  headerSection(),
                  SizedBox(height: 20.h),
                  footerSection()
                ],
              ),
            ),
          // ),
        // ),
      // ),
    );
  }

  Column footerSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EduconnectButton(
            button: EduconnectElevatedButton(
          onPressed: onSignupButtonPressed,
          text: EduconnectConstants.localization().sign_up,
          height: 35.h,
        )),
        SizedBox(height: 10.h),
        EduconnectButton(
            button: EduconnectElevatedButton(
          onPressed: onSigninButtonPressed,
          isLightMode: true,
          text: EduconnectConstants.localization().sign_in,
        )),
      ],
    );
  }

  onSignupButtonPressed() {
    // EduconnectNavigator.push(Routes.signupScreen);
    currentContext!
        .read<AuthCubit>()
        .signUp(email: 'ziad@test.com', password: 'password');
  }

  onSigninButtonPressed() {
    EduconnectNavigator.push(Routes.signinScreen);
  }

  Column headerSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EduconnectImageWidget.asset(
          url: EduconnectAssets.authImage,
          height: EduconnectConstants.educonnect_screen_height * 0.5,
        ),
        Text(
          EduconnectConstants.localization().welcome,
          style: EduconnectTextStyles.style20,

          /* TextStyle(
            fontSize: 20.sp,
            // fontWeight: FontWeight.w600,
            // color: Colors.white,
          ), */
        ),
        SizedBox(height: 12.h),
        Text(
          EduconnectConstants.localization().manage_school_with_app,
          textAlign: TextAlign.center,
          style: EduconnectTextStyles.style14,

          /* TextStyle(
            fontSize: 14.sp,
            // fontWeight: FontWeight.w600,
            // color: Colors.white,
          ), */
        ),
      ],
    );
  }
}