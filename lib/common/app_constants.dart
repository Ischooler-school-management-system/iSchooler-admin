// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/l10n.dart';
import 'navigation/mawjood_navi.dart';

abstract class EduConnectConstants {
  static final double mawjood_button_height = 60.h;
  static final double mawjood_button_radius = 10.r;

  // Get the text theme from the current theme currentContext!.
  static final TextTheme text_theme = Theme.of(currentContext!).textTheme;

  // Get the screen size, height, and width from the current currentContext!.
  static final Size mawjood_screen_size = MediaQuery.of(currentContext!).size;

  static final double mawjood_screen_height =
      MediaQuery.of(currentContext!).size.height;

  static final double mawjood_screen_width =
      MediaQuery.of(currentContext!).size.width;

  static final bool isTablet = MediaQuery.of(currentContext!).size.width > 600;

  static S localization() => S.of(currentContext!);

  static bool isCurrentLocaleArabic() {
    Locale? currentLocale = Localizations.localeOf(currentContext!);
    return currentLocale.languageCode.toLowerCase() == 'ar';
  }

  /* static String egpPriceText(num price) {
    bool isArabic = isCurrentLocaleArabic();
    String currency = localization().egp;

    if (isArabic) {
      return '${price.toStringAsFixed(2)} $currency';
    } else {
      return '$currency ${price.toStringAsFixed(2)}';
    }
  }
*/
}
