import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

import 'app_listeners.dart';
import 'app_materialapp.dart';
import 'common/di.dart';
import 'common/educonnect_local_settings.dart';
import 'firebase_options.dart';

/// app initial settings:
/// inside main:
//   1. localization
///    1.install localization package and intl extension(done)
///    2.set up change lang from the app
///       i.stream to listen for the change
///       ii.save chosen lang in sharedpref

//   2. fixed scale(done)
//   3. themes
//   4. smart dialog(done)
//   4. DI (done)
//   5. setPreferredOrientations(done)
//   7. onboarding for first time only
//   8. custom navigator(done)
//   Loading and error cubits(done)
// Madpoly(custom printing class)(done)

Future<void> main() async {
  /// this is responsible for the Dependency Injection in the app
  await DependencyInjection().registerSingleton();

  /// ScreenUtil is used to make app responsible
  /// setting up ScreenUtil(1):
  await ScreenUtil.ensureScreenSize();

  final bool isFirstTime = await MawjoodLocalSettings.isFirstTime();
  // 1. localization(1)
  final int currentLang = await MawjoodLocalSettings.getCurrentLang();

  // firebase setup
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// 5. setPreferredOrientations:
  /// here we set the app Orientation to work in portraitUp only so it doesn't rotate
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) => runApp(MyApp(
      isFirstTime: isFirstTime,
      currentLang: currentLang,
    )),
  );
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  final int currentLang;

  const MyApp(
      {super.key, required this.isFirstTime, required this.currentLang});

  @override
  Widget build(BuildContext context) {
    // 1. localization(3)
    final BehaviorSubject<int> languageSubject =
        BehaviorSubject<int>.seeded(-1);

    /// AppListeners is the widget that contains all listeners needed on the starting of the app
    return AppListeners(
      /// setting up ScreenUtil(2):
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          /// this is the language stream builder
          /// that listens to selected language changes and apply it
          return StreamBuilder(
            stream: languageSubject.stream,
            initialData: currentLang,
            builder: (context, AsyncSnapshot<int> snapshot) {
              return AppMaterialApp(snapshot: snapshot);
            },
          );
        },
      ),
    );
  }
}
