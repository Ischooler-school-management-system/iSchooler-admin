import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../common/ischooler_constants.dart';
import '../../../../../../common/style/ischooler_colors.dart';

class LanguageWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function(bool)? onChanged;
  const LanguageWidget(
      {super.key,
      required this.isSelected,
      this.onChanged,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged?.call(!isSelected);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: IschoolerConstants.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              size: IschoolerConstants.educonnect_screen_height / 33,
              color: IschoolerColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
