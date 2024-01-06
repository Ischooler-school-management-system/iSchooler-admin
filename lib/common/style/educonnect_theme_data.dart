import 'package:flutter/material.dart';

import 'educonnect_colors.dart';

ThemeData buildThemeData() {
  return ThemeData(
    // useMaterial3 brings flutter new ui to the app
    useMaterial3: true,
    fontFamily: 'Almarai',
    // textTheme: AppTextStyles.appTextThemes,
    scaffoldBackgroundColor: EduconnectColors.backgroundColor,
  );
}
