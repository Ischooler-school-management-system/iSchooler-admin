import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../educonnect_constants.dart';
import '../../style/educonnect_colors.dart';

class EduconnectLoadingSnackbar extends StatelessWidget {
  final String message;

  const EduconnectLoadingSnackbar({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.h),
      padding: const EdgeInsets.symmetric(
          vertical: 12, horizontal: 16), // Adjust vertical padding
      decoration: BoxDecoration(
        color: EduconnectColors.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(
            height: 24, // Adjust the height of the CircularProgressIndicator
            width: 24, // Adjust the width of the CircularProgressIndicator
            child: SpinKitRing(
              color: EduconnectColors.accentColor,
              lineWidth: 3,
            ),
          ),
          const SizedBox(width: 8),
          Text(message,
              style: EduconnectConstants.textTheme.labelMedium!
                  .copyWith(color: EduconnectColors.accentColor)),
        ],
      ),
    );
  }
}
