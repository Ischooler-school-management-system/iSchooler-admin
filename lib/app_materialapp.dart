import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'common/madpoly.dart';
import 'common/navigation/router.export.dart';
import 'common/style/educonnect_theme_data.dart';
import 'features/auth/presentation/screens/auth_screen.dart';
import 'generated/l10n.dart';

class AppMaterialApp extends StatelessWidget {
  final AsyncSnapshot<int> snapshot;
  const AppMaterialApp({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      // material app initial settings
      // 1. localization(3)
      // locale: getSelecetedLanguage(snapshot),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // ----------------------------------

      //   3. themes
      theme: buildThemeData(),
      // ----------------------------------

      // 8. custom navigator
      navigatorKey: EduconnectNavigator.navigatorState,
      onGenerateRoute: EduconnectNavigator.onCreateRoute,
      // ----------------------------------

      // to remove the debug banner showed in the screen
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
      // home: const SigninScreen(),
      

      ///4. smart dialog:
      /// FlutterSmartDialog is a package that provide dialogs and toasts without a context
      builder: materialAppBuilder(),
    );
  }
}

TransitionBuilder materialAppBuilder() {
  return FlutterSmartDialog.init(
    // this part makes the font of the app doesn't affect with the device font size
    builder: (context, child) {
      final mediaQueryData = MediaQuery.of(context);

      /// 2. fixed scale:
      ///  here we check if the app opened on tablet to make the scale 0.8
      /// because the tablet font is big when the scale is 1
      final bool isTablet = mediaQueryData.size.width > 600;
      return MediaQuery(
        data: mediaQueryData.copyWith(
            textScaler: TextScaler.linear(isTablet ? 0.8 : 1.0)),
        child: child ?? const SizedBox(),
      );
    },
  );
}

Locale getSelecetedLanguage(AsyncSnapshot<int> snapshot) {
  if ((snapshot.data == 1)) {
    Madpoly.print('snapshot.data: ${snapshot.data}');
    return const Locale('en', '');
  } else {
    Madpoly.print('snapshot.data: ${snapshot.data}');
    return const Locale('ar', '');
  }
}
