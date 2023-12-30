import 'package:flutter/material.dart';
import 'package:school_admin/features/auth/presentation/screens/sign_in_screen.dart';

import '../../features/auth/presentation/screens/auth_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
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
    return hasAnimation
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

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.authScreen:
        return slideNavigation(screen: const AuthScreen());
      case Routes.signinScreen:
        return slideNavigation(screen: const SigninScreen());
      case Routes.signupScreen:
        return slideNavigation(screen: const SignupScreen());
      default:
        {
          return slideNavigation(screen: const AuthScreen());
        }
    }
  }

  static void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
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
}
