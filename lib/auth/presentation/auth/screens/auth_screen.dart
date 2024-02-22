import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/common_features/widgets/buttons/educonnect_button.dart';
import '../../../../../common/common_features/widgets/buttons/models/buttons_model.dart';
import '../../../../../common/common_features/widgets/educonnect_image_widget.dart';
import '../../../../../common/common_features/widgets/educonnect_screen.dart';
import '../../../../../common/educonnect_assets.dart';
import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/madpoly.dart';
import '../../../../../common/navigation/router.export.dart';
import '../../../../../common/style/educonnect_text_theme.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'auth_screen > build',
      developer: "Ziad",
    );
    return IschoolerScreen(
      padding: const EdgeInsets.all(20),
      keepMobileView: true,
      alignment: Alignment.center,
      enableScrolling: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [headerSection(), SizedBox(height: 20.h), footerSection()],
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
        IschoolerButton(
            button: IschoolerElevatedButton(
          onPressed: onSignupButtonPressed,
          text: IschoolerConstants.localization().sign_up,
          height: 35.h,
        )),
        SizedBox(height: 10.h),
        IschoolerButton(
            button: IschoolerElevatedButton(
          onPressed: onSigninButtonPressed,
          isLightMode: true,
          text: IschoolerConstants.localization().sign_in,
        )),
      ],
    );
  }

  onSignupButtonPressed() {
    IschoolerNavigator.push(Routes.signupScreen);
    //   currentContext!
    //       .read<AuthCubit>()
    //       .signUp(email: 'ziad@test.com', password: 'password');
  }

  onSigninButtonPressed() {
    IschoolerNavigator.push(Routes.signinScreen);
  }

  Column headerSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IschoolerImageWidget.asset(
          url: IschoolerAssets.authImage,
          height: IschoolerConstants.educonnect_screen_height * 0.5,
        ),
        Text(
          IschoolerConstants.localization().welcome,
          style: IschoolerTextStyles.style20,

          /* TextStyle(
            fontSize: 20.sp,
            // fontWeight: FontWeight.w600,
            // color: Colors.white,
          ), */
        ),
        SizedBox(height: 12.h),
        Text(
          IschoolerConstants.localization().manage_school_with_app,
          textAlign: TextAlign.center,
          style: IschoolerTextStyles.style14,

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
