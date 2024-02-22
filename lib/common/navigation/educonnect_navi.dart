import 'package:flutter/material.dart';

import '../../auth/presentation/auth/screens/auth_screen.dart';
import '../../auth/presentation/auth/screens/select_role_screen.dart';
import '../../auth/presentation/signin/screens/sign_in_screen.dart';
import '../../auth/presentation/signup/screens/sign_up_password_screen.dart';
import '../../auth/presentation/signup/screens/sign_up_screen.dart';
import '../../side_bar/educonnect_side_bar.dart';
import '../common_features/responsive/responsive.dart';
import '../common_features/widgets/educonnect_screen.dart';
import '../educonnect_constants.dart';
import '../madpoly.dart';
import 'routes.dart';

// implement or extend custom navi goto(target,targetId)

/// Global Context of App
BuildContext? get currentContext =>
    IschoolerNavigator.navigatorState.currentContext;

abstract class IschoolerNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static PageRouteBuilder<dynamic> slideNavigation({
    required Widget screen,
    bool hasAnimation = true,
    Object? arguments,
  }) {
    return hasAnimation && Responsive.isMobile()
        ? PageRouteBuilder(
            pageBuilder: (_, animation, secondaryAnimation) => screen,
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var tween = Tween(
                begin: IschoolerConstants.isCurrentLocaleArabic()
                    ? const Offset(-1.0, 0.0)
                    : const Offset(1.0, 0.0),
                end: Offset.zero,
              );

              var offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
            settings: RouteSettings(
              arguments: arguments,
            ),
          )
        : PageRouteBuilder(
            pageBuilder: (_, animation, secondaryAnimation) => screen,
            settings: RouteSettings(
              arguments: arguments,
            ),
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
      Madpoly.print(
        'arguments  $arguments',
        tag: 'educonnect_navi > push',
        developer: "Ziad",
      );
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }

  static Object? getPassedData(context, {required Object? defaultValue}) {
    try {
      Object? arguments2 = ModalRoute.of(context)?.settings.arguments;
      if (arguments2 != null &&
          arguments2.runtimeType == defaultValue.runtimeType) {
        return arguments2;
      } else {
        return defaultValue;
      }
    } catch (e) {
      Madpoly.print(
        'error = $e',
        tag: 'educonnect_navi > getPassedData',
        developer: "Ziad",
      );
    }
    return defaultValue;
  }

  static void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static void navigateToScreen(Widget screen,
      {bool replace = false, bool hasAnimation = true}) {
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
      // case Routes.selectRoleScreen:
      //   return slideNavigation(
      //       screen: const SelectRoleScreen(), arguments: settings.arguments);
      case Routes.authScreen:
        return slideNavigation(
            screen: const AuthScreen(), arguments: settings.arguments);
      case Routes.signinScreen:
        return slideNavigation(
            screen: const SigninScreen(), arguments: settings.arguments);
      case Routes.signupScreen:
        return slideNavigation(
            screen: const SignupScreen(), arguments: settings.arguments);
      case Routes.signupPasswordScreen:
        return slideNavigation(
            screen: const SignupPasswordScreen(),
            arguments: settings.arguments);
      /* case Routes.studentDetailsScreen:
        return slideNavigation(
            screen: DashboardDetailsScreen(currentData: StudentModel.empty()),
            arguments: settings.arguments);
      case Routes.adminDetailsScreen:
        return slideNavigation(
            screen: AdminDetailsForm(currentAdminData: AdminModel.empty()),
            arguments: settings.arguments);
      */
      case Routes.sideBarScreen:
        return slideNavigation(
            screen: const IschoolerSideBar(), arguments: settings.arguments);
      default:
        {
          return slideNavigation(
              screen: const NoScreen(), arguments: settings.arguments);
        }
    }
  }
}

class NoScreen extends StatelessWidget {
  const NoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'test_screen > ',
      developer: "Ziad",
    );

    return const IschoolerScreen(
      keepMobileView: true,
      alignment: Alignment.center,
      body: Center(child: Text('No such screen')),
    );
  }
}
