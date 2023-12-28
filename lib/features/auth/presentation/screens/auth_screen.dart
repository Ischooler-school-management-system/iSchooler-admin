import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_admin/common/features/widgets/responsive.dart';

import '../../../../common/app_constants.dart';
import '../../../../common/educonnect_assets.dart';
import '../../../../common/features/widgets/buttons/educonnect_button.dart';
import '../../../../common/features/widgets/buttons/models/buttons_model.dart';
import '../../../../common/features/widgets/educonnect_image_widget.dart';
import '../../../../common/navigation/router.export.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxWidth: Responsive.isMobile()
              ? double.infinity
              : EduConnectConstants.educonnect_screen_width*0.5,
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
          onPressed: () {
            EduconnectNavigator.push(Routes.signinScreen);
          },
          text: 'sign Up',
          height: 35.h,
        )),
        SizedBox(height: 10.h),
        EduconnectButton(
            button: EduconnectElevatedButton(
          onPressed: () {},
          isLightMode: true,
          text: 'sign in',
        )),
      ],
    );
  }

  Column headerSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EduconnectImageWidget.asset(
          url: EduconnectAssets.authImage,
          height: EduConnectConstants.educonnect_screen_height * 0.5,
        ),
        Text(
          'Welcome',
          style: TextStyle(
            fontSize: 20.sp,
            // fontWeight: FontWeight.w600,
            // color: Colors.white,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Now you can manage your entire school with EduConnect app',
          style: TextStyle(
            fontSize: 14.sp,
            // fontWeight: FontWeight.w600,
            // color: Colors.white,
          ),
        ),
      ],
    );
  }
}
