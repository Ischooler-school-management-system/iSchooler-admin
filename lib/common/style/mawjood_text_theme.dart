import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mawjood_colors.dart';

///web sizes
/// 36 semibold
/// 24 meduim, semibold
/// 16 regular, meduim
/// 14 regular, meduim, semibold

///
class AppTextStyles {
  static TextTheme appTextThemes = TextTheme(

/* 

GoogleFonts.kumbhSans(
              textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff4F4F4F)),
            ),

 */

    /// 36 semibold
    displayLarge: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: MawjoodColors.blue,
        fontSize: 24.sp,
      ),
    ),

    /// 24 meduim, semibold

    displayMedium: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: MawjoodColors.blue,
        fontSize: 24.sp,
      ),
    ),

    /// 16 regular, meduim

    displaySmall: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: MawjoodColors.grey,
        fontSize: 16.sp,
      ),
    ),

    /// 14 regular, meduim, semibold

    titleMedium: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: MawjoodColors.blue,
        fontSize: 14.sp,
      ),
    ),

    /// 12 regular, meduim, bold

    titleSmall: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: MawjoodColors.blue,
        fontSize: 12.sp,
      ),
    ),
  );
}

/// colors
/// 2D88D4 blue primary
/// 4F4F4F grey for headline text
/// 667085 grey for small text
