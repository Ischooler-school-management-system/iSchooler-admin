import 'package:flutter/material.dart';
import 'package:school_admin/common/style/educonnect_text_theme.dart';

ThemeData buildThemeData() {
  return ThemeData(
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    // useMaterial3 brings flutter new ui to the app
    useMaterial3: true,
    fontFamily: 'KumbhSans',
    textTheme: AppTextStyles.appTextThemes,
  );
}
