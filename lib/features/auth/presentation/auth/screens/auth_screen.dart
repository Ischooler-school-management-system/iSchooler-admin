import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/educonnect_assets.dart';
import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/features/widgets/buttons/educonnect_button.dart';
import '../../../../../common/features/widgets/buttons/models/buttons_model.dart';
import '../../../../../common/features/widgets/educonnect_image_widget.dart';
import '../../../../../common/features/widgets/educonnect_screen.dart';
import '../../../../../common/features/widgets/responsive.dart';
import '../../../../../common/navigation/router.export.dart';
import '../../../../../common/style/educonnect_text_theme.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      body: Container(
        constraints: BoxConstraints(
          maxWidth: Responsive.isMobile()
              ? double.infinity
              : EduconnectConstants.educonnect_screen_width * 0.5,
          maxHeight: Responsive.isMobile()
              ? double.infinity
              : EduconnectConstants.educonnect_screen_width * 0.5,
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerSection(),
              SizedBox(height: 20.h),
              footerSection()
            ],
          ),
        ),
      ),
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
    EduconnectNavigator.push(Routes.signupScreen);
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
