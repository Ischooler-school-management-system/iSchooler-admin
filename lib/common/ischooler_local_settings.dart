import 'package:shared_preferences/shared_preferences.dart';

import 'madpoly.dart';

class IschoolerLocalSettings {
  static const String _firstTimeKey = 'isFirstTime';
  static const String _savedLang = 'language_index';

  static Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = prefs.getBool(_firstTimeKey) ?? true;
    Madpoly.print(
      'isFirstTime = $value',
      developer: 'ziad',
      tag: 'OnboardingManager',
    );
    return value;
  }

  static Future<int> getCurrentLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = prefs.getInt(_savedLang) ?? 0;
    Madpoly.print(
      '(LanguageSettings=> get )language_index = $value',
      developer: 'ziad',
      tag: 'OnboardingManager',
    );
    return value;
  }

  static Future<void> setFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Madpoly.print(
      'setFirstTime',
      developer: 'ziad',
      tag: 'OnboardingManager',
    );

    await prefs.setBool(_firstTimeKey, false);
  }

  static Future<void> saveCurrentLang(int lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Madpoly.print(
      '(LanguageSettings=> save )setLang $lang',
      developer: 'ziad',
      tag: 'OnboardingManager',
    );
    await prefs.setInt('language_index', lang);
  }
}
