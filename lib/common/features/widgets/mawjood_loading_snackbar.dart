import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../app_constants.dart';
import '../../style/mawjood_colors.dart';

class MawjoodLoadingSnackbar extends StatelessWidget {
  final String message;

  const MawjoodLoadingSnackbar({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.h),
      padding: EdgeInsets.symmetric(
          vertical: 12.h, horizontal: 16.w), // Adjust vertical padding
      decoration: BoxDecoration(
        color: MawjoodColors.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(
            height: 24, // Adjust the height of the CircularProgressIndicator
            width: 24, // Adjust the width of the CircularProgressIndicator
            child: SpinKitRing(
              color: MawjoodColors.accentColor,
              lineWidth: 3,
            ),
          ),
          const SizedBox(width: 8),
          Text(message,
              style: EduConnectConstants.text_theme.labelMedium!
                  .copyWith(color: MawjoodColors.accentColor)),
        ],
      ),
    );
  }
}
