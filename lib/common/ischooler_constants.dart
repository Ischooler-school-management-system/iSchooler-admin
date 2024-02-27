// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/l10n.dart';
import 'navigation/ischooler_navi.dart';

abstract class IschoolerConstants {
  // static bool testMode = true;
  static const bool testMode = false;

  static final double educonnect_button_height = 35.h;
  static final double educonnect_button_radius = 8.r;
  static const EdgeInsets educonnect_screen_padding = EdgeInsets.all(20);

  // Get the text theme from the current theme currentContext!.
  static final TextTheme textTheme = Theme.of(currentContext!).textTheme;

  // Get the screen size, height, and width from the current currentContext!.
  static final Size educonnect_screen_size =
      MediaQuery.of(currentContext!).size;

  static final double educonnect_screen_height =
      MediaQuery.of(currentContext!).size.height;

  static final double educonnect_screen_width =
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
