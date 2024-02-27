import 'package:flutter/material.dart';

import 'ischooler_colors.dart';

ThemeData buildThemeData() {
  return ThemeData(
    // useMaterial3 brings flutter new ui to the app
    useMaterial3: true,
    fontFamily: 'Almarai',
    colorScheme: ColorScheme.fromSeed(seedColor: IschoolerColors.blue),

    // textTheme: AppTextStyles.appTextThemes,
    scaffoldBackgroundColor: IschoolerColors.backgroundColor,
  );
}
