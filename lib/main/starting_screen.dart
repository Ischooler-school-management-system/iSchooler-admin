import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/auth/screens/auth_screen.dart';
import '../side_bar/educonnect_side_bar.dart';

class StartingScreen extends StatefulWidget {
  /// this screen is only for deciding the home screen
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    /* if (FirebaseAuth.instance.currentUser != null) {
      return const EduconnectSideBar();
    } else {
      return const AuthScreen();
    } */
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, authSnapshot) {
          // return homeScreen(authSnapshot);
          // if (authSnapshot.connectionState != ConnectionState.waiting) {
          if (authSnapshot.hasData) {
            return const EduconnectSideBar();
          } else {
            return const AuthScreen();
          }
        } /* else {
          return const EduconnectScreen();
        } */
        // },
        );
  }
}
