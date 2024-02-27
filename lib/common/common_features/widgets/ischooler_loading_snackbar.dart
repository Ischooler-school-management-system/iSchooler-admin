import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../ischooler_constants.dart';
import '../../style/ischooler_colors.dart';

class IschoolerLoadingSnackbar extends StatelessWidget {
  final String message;

  const IschoolerLoadingSnackbar({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.h),
      padding: const EdgeInsets.symmetric(
          vertical: 12, horizontal: 16), // Adjust vertical padding
      decoration: BoxDecoration(
        color: IschoolerColors.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(
            height: 24, // Adjust the height of the CircularProgressIndicator
            width: 24, // Adjust the width of the CircularProgressIndicator
            child: SpinKitRing(
              color: IschoolerColors.accentColor,
              lineWidth: 3,
            ),
          ),
          const SizedBox(width: 8),
          Text(message,
              style: IschoolerConstants.textTheme.labelMedium!
                  .copyWith(color: IschoolerColors.accentColor)),
        ],
      ),
    );
  }
}
