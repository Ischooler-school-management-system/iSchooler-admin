import 'package:flutter/material.dart';

import 'educonnect_colors.dart';

class IschoolerTextStyles {
  /// used font sizes
  static const double font12 = 12;
  static const double font10 = 10;
  static const double font14 = 14;
  static const double font16 = 16;
  static const double font20 = 20;

  /// used font wieghts
  static const FontWeight weight500 = FontWeight.w500;

  /// common fonts

  static const style10Grey = TextStyle(
    fontSize: font10,
    color: IschoolerColors.grey,
  );

  static const TextStyle style12Blue = TextStyle(
    color: IschoolerColors.primaryColor,
    fontSize: font12,
  );

  static const TextStyle style14 = TextStyle(fontSize: font14);

  static const TextStyle styleBlackW500 = TextStyle(
    color: Colors.black,
    fontWeight: weight500,
  );

  static const TextStyle style14BlueW500 = TextStyle(
    color: IschoolerColors.primaryColor,
    fontSize: font14,
    fontWeight: weight500,
  );
  static const TextStyle style14White =
      TextStyle(fontSize: font14, color: Colors.white);

  static const TextStyle style16 = TextStyle(fontSize: font16);

  static const TextStyle style20 = TextStyle(fontSize: font20);

  static const TextStyle style20White = TextStyle(
    fontSize: font20,
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
