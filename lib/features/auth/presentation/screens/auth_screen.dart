import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_admin/common/features/widgets/buttons/educonnect_button.dart';
import 'package:school_admin/common/features/widgets/buttons/models/buttons_model.dart';

import '../../../../common/app_constants.dart';
import '../../../../common/educonnect_assets.dart';
import '../../../../common/features/widgets/educonnect_image_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 20.h),
            MawjoodButton(
                button: MawjoodElevatedButton(
              onPressed: () {},
              text: 'sign Up',
              height: 35.h,
            )),
            SizedBox(height: 10.h),
            MawjoodButton(
                button: MawjoodElevatedButton(
              onPressed: () {},
              isLightMode: true,
              text: 'sign in',
            ))
          ],
        ),
      ),
    );
  }
}
