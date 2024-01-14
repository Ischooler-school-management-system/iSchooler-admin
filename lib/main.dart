import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

import 'common/di.dart';
import 'common/educonnect_local_settings.dart';
import 'common/madpoly.dart';
import 'firebase_options.dart';
import 'main/educonnect_listeners.dart';
import 'main/educonnect_materialapp.dart';

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

  final bool isFirstTime = await EduconnectLocalSettings.isFirstTime();
  // 1. localization(1)
  final int currentLang = await EduconnectLocalSettings.getCurrentLang();
  WidgetsFlutterBinding.ensureInitialized();
  // firebase setup
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      /* options: const FirebaseOptions(
    apiKey: 'AIzaSyCqUoe7uNYPcIPHb4deFPm-X7GVIRv311g',
    appId: '1:497792930106:web:dd37f1d7f7ecc3acc7c003',
    messagingSenderId: '497792930106',
    projectId: 'educonnect-7716d',
    authDomain: 'educonnect-7716d.firebaseapp.com',
    storageBucket: 'educonnect-7716d.appspot.com',
  ), */
    );
  } catch (e) {
    Madpoly.print(
      '$e',
      tag: 'main > Firebase.initializeApp',
      developer: "Ziad",
    );
  }

  /// 5. setPreferredOrientations:
  /// here we set the app Orientation to work in portraitUp only so it doesn't rotate
  /// this condition must be for mobile only if the project works for web it will throw an error
  /* SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) => */
  runApp(
    MyApp(
      isFirstTime: isFirstTime,
      currentLang: currentLang,
    ),
    // ),
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
    return EduconnectListeners(
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
              return EduconnectMaterialApp(
                languageSnapshot: snapshot,
                currentLang: currentLang,
              );
            },
          );
        },
      ),
    );
  }
}
