import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_constants.dart';
import '../../../../common/educonnect_assets.dart';
import '../../../../common/features/widgets/educonnect_image_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         /*  EduconnectImageWidget.asset(
            url: EduconnectAssets.authImage,
            height: EduConnectConstants.educonnect_screen_height * 0.2,
          ), */

          Image.asset(EduconnectAssets.authImage),
          Text(
              'Welcome',
              style: TextStyle(
                fontSize: 20.sp,
                // fontWeight: FontWeight.w600,
                // color: Colors.white,
              ),
            ),
            Text(
              'Now you can manage your entire school with EduConnect app',
              style: TextStyle(
                fontSize: 14.sp,
                // fontWeight: FontWeight.w600,
                // color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
