import 'package:flutter/material.dart';

class IschoolerErrorScreen extends StatelessWidget {
  final String? text;
  const IschoolerErrorScreen({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          text ?? /* IschoolerConstants.localization(). */ 'major_error',
          // style: IschoolerConstants.text_theme.bodyLarge!.copyWith(
          //   fontWeight: FontWeight.w600,
          // ),
        ),
        /* Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: IschoolerConstants.ischooler_screen_height / 4),
            Image.asset(IschoolerAssets.error_animated_icon),
            SizedBox(height: 10.h),
            Text(
              text,
              style: IschoolerConstants.text_theme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ), */
      ),
    );
  }
}
