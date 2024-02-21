import 'package:flutter/material.dart';

class EduconnectErrorScreen extends StatelessWidget {
  final String? text;
  const EduconnectErrorScreen({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          text ?? /* EduconnectConstants.localization(). */ 'major_error',
          // style: EduconnectConstants.text_theme.bodyLarge!.copyWith(
          //   fontWeight: FontWeight.w600,
          // ),
        ),
        /* Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: EduconnectConstants.educonnect_screen_height / 4),
            Image.asset(EduconnectAssets.error_animated_icon),
            SizedBox(height: 10.h),
            Text(
              text,
              style: EduconnectConstants.text_theme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ), */
      ),
    );
  }
}
