import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'educonnect_colors.dart';

class EduconnectTextStyles {
  /// used font sizes
  static final double font12 = 12.sp;
  static final double font10 = 10.sp;
  static final double font14 = 14.sp;
  static final double font16 = 16.sp;
  static final double font20 = 20.sp;

  /// used font wieghts
  static const FontWeight weight500 = FontWeight.w500;

  /// common fonts

  static final style10Grey = TextStyle(
    fontSize: font10,
    color: EduconnectColors.grey,
  );

  static final TextStyle style12Blue = TextStyle(
    color: EduconnectColors.primaryColor,
    fontSize: font12,
  );

  static final TextStyle style14 = TextStyle(fontSize: font14);

  static const TextStyle styleBlackW500 = TextStyle(
    color: Colors.black,
    fontWeight: weight500,
  );

  static final TextStyle style14BlueW500 = TextStyle(
    color: EduconnectColors.primaryColor,
    fontSize: font14,
    fontWeight: weight500,
  );
  static final TextStyle style14White = TextStyle(
    fontSize: font14,
    color: Colors.white
  );

  static final TextStyle style16 = TextStyle(fontSize: font16);

  static final TextStyle style20 = TextStyle(fontSize: font20);

  static final TextStyle style20White = TextStyle(
    fontSize: 20.sp,
    color: Colors.white,
  );
/*
  static TextTheme appTextThemes = const TextTheme(
 

GoogleFonts.kumbhSans(
              textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff4F4F4F)),
            ),

      );
 */
}
