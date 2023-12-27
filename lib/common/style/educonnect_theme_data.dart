import 'package:flutter/material.dart';
import 'educonnect_text_theme.dart';

ThemeData buildThemeData() {
  return ThemeData(
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    // useMaterial3 brings flutter new ui to the app
    useMaterial3: true,
    fontFamily: 'Poppins',
    textTheme: AppTextStyles.appTextThemes,
  );
}
