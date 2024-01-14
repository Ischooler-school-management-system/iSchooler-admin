import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:school_admin/test_screen.dart';

import '../common/educonnect_constants.dart';
import '../common/features/error_handling/data/models/error_handling_model.dart';
import '../common/features/error_handling/logic/cubit/error_handling_cubit.dart';
import '../common/features/loading/logic/cubit/loading_cubit.dart';
import '../common/features/loading/presentation/loading_popup.dart';
import '../common/madpoly.dart';
import '../common/navigation/educonnect_navi.dart';
import '../common/navigation/routes.dart';
import '../features/auth/logic/cubit/auth_cubit.dart';
import 'bloc_providers.dart';

class EduconnectListeners extends StatelessWidget {
  final Widget child;
  const EduconnectListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return listOfBlocProviders(
        child: BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: authListener,
      child: BlocListener<ErrorHandlingCubit, ErrorHandlingState>(
        listener: errorListener,
        listenWhen: (previous, current) {
          return previous.error.createdAt != current.error.createdAt;
        },
        child: BlocListener<LoadingCubit, LoadingState>(
          listener: loadingListener,
          listenWhen: (previous, current) =>
              previous.loading.loadingStatus != current.loading.loadingStatus,
          child: child,
        ),
      ),
    ));
  }

  void authListener(BuildContext context, AuthState state) {
    Madpoly.print('state = $state',
        tag: 'starting_screen > ', developer: "Ziad");

    // if (state.isAuthenticated()) {
    if (state.status == AuthStatus.authenticated) {
      Madpoly.print('isAuthenticated',
          tag: 'starting_screen > ', developer: "Ziad");
      // User is authenticated, navigate to home screen
      EduconnectNavigator.push(Routes.sideBarScreen, replace: true);
      // } else if (state.isUnauthenticated()) {
    } else if (state.status == AuthStatus.unauthenticated) {
      Madpoly.print('isUnauthenticated',
          tag: 'starting_screen > ', developer: "Ziad");

      // User is signed out, navigate to authentication screen
      EduconnectNavigator.push(Routes.authScreen, replace: true);
      // EduconnectNavigator.navigateToScreen(const TestScreen(), replace: true);
    }
  }

  void errorListener(BuildContext context, ErrorHandlingState state) {
    final authSnackBar = SnackBar(
      content: Text(EduconnectConstants.localization().login_dialog_content),
      duration: const Duration(seconds: 30),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        onPressed: () {},
        label: EduconnectConstants.localization().sign_in,
      ),
    );
    final noInternetSnackBar = SnackBar(
      content: Text(EduconnectConstants.localization().no_internet_connection),
      duration: const Duration(seconds: 30),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
          onPressed: () {
            ScaffoldMessenger.of(currentContext!).hideCurrentSnackBar();
          },
          label: EduconnectConstants.localization().cancel),
    );

    Madpoly.print(
      state.error,
      developer: "Ahmed",
      tag: "main.dart -> error BlocListener",
      isLog: false,
    );

    switch (state.error.type) {
      case ErrorHandlingTypes.None:
        ScaffoldMessenger.of(currentContext!).hideCurrentSnackBar();
        break;

      case ErrorHandlingTypes.InternetConnection:
        ScaffoldMessenger.of(currentContext!).hideCurrentSnackBar();
        ScaffoldMessenger.of(currentContext!).showSnackBar(noInternetSnackBar);
        break;

      case ErrorHandlingTypes.AuthenticationError:
        ScaffoldMessenger.of(currentContext!).hideCurrentSnackBar();
        ScaffoldMessenger.of(currentContext!).showSnackBar(authSnackBar);
        break;

      case ErrorHandlingTypes.MajorError:
        // context.read<AuthCubit>().onLogoutButtonClicked();
        break;

      case ErrorHandlingTypes.Alert:
        if (state.error.showToast) {
          SmartDialog.dismiss();
          SmartDialog.showToast(state.error.message);
        }
        break;

      default:
        if (state.error.showToast) {
          SmartDialog.dismiss();
          SmartDialog.showToast(
            '${EduconnectConstants.localization().there_is_an_error} ${state.error.message}',
          );
        }
    }
  }

  void loadingListener(BuildContext context, LoadingState state) {
    LoadingPopup.show(state.loading);
  }
}
