import 'package:flutter/material.dart';
import 'package:school_admin/common/features/responsive/responsive.dart';
import 'package:school_admin/features/auth/presentation/signup/screens/sign_up_password_screen.dart';
import 'package:school_admin/features/users/students/presentation/screens/add_student_screen.dart';
import 'package:school_admin/side_bar/educonnect_side_bar.dart';

import '../../features/auth/presentation/auth/screens/auth_screen.dart';
import '../../features/auth/presentation/signin/screens/sign_in_screen.dart';
import '../../features/auth/presentation/signup/screens/sign_up_screen.dart';
import '../educonnect_constants.dart';
import 'routes.dart';

// implement or extend custom navi goto(target,targetId)

/// Global Context of App
BuildContext? get currentContext =>
    EduconnectNavigator.navigatorState.currentContext;

abstract class EduconnectNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static PageRouteBuilder<dynamic> slideNavigation(
      {required Widget screen, bool hasAnimation = true}) {
    return hasAnimation && Responsive.isMobile()
        ? PageRouteBuilder(
            pageBuilder: (_, animation, secondaryAnimation) => screen,
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var tween = Tween(
                begin: EduconnectConstants.isCurrentLocaleArabic()
                    ? const Offset(-1.0, 0.0)
                    : const Offset(1.0, 0.0),
                end: Offset.zero,
              );

              var offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
          )
        : PageRouteBuilder(
            pageBuilder: (_, animation, secondaryAnimation) => screen,
          );
  }

  // track navigation of user
  static push(
    String routeName, {
    arguments,
    bool replace = false,
    bool clean = false,
  }) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
        routeName,
        (_) => false,
        arguments: arguments,
      );
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }

  static void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static void navigateToScreen(Widget screen,
      {bool replace = false, bool hasAnimation = false}) {
    if (replace) {
      navigatorState.currentState!.pushReplacement(
          slideNavigation(screen: screen, hasAnimation: hasAnimation));
    } else {
      navigatorState.currentState!
          .push(slideNavigation(screen: screen, hasAnimation: hasAnimation));
    }
  }

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.authScreen:
        return slideNavigation(screen: const AuthScreen());
      case Routes.signinScreen:
        return slideNavigation(screen: const SigninScreen());
      case Routes.signupScreen:
        return slideNavigation(screen: const SignupScreen());
      case Routes.signupPasswordScreen:
        return slideNavigation(screen: const SignupPasswordScreen());
      case Routes.addStudentScreen:
        return slideNavigation(screen: const AddStudentScreen());
      case Routes.sideBarScreen:
        return slideNavigation(screen: const EduconnectSideBar());
      default:
        {
          return slideNavigation(screen: const AuthScreen());
        }
    }
  }
}
