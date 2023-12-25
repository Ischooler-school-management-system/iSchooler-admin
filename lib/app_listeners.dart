import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'common/app_constants.dart';
import 'bloc_providers.dart';
import 'common/features/error_handling/data/models/error_handling_model.dart';
import 'common/features/error_handling/logic/cubit/error_handling_cubit.dart';
import 'common/features/loading/logic/cubit/loading_cubit.dart';
import 'common/features/loading/presentation/loading_popup.dart';
import 'common/madpoly.dart';
import 'common/navigation/mawjood_navi.dart';

class AppListeners extends StatelessWidget {
  final Widget child;
  const AppListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return listOfBlocProviders(
      child:BlocListener<ErrorHandlingCubit, ErrorHandlingState>(
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
    );
  }

  void errorListener(BuildContext context, ErrorHandlingState state) {
    final authSnackBar = SnackBar(
      content: Text(EduConnectConstants.localization().login_dialog_content),
      duration: const Duration(seconds: 30),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        onPressed: () {},
        label: EduConnectConstants.localization().sign_in,
      ),
    );
    final noInternetSnackBar = SnackBar(
      content: Text(EduConnectConstants.localization().no_internet_connection),
      duration: const Duration(seconds: 30),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
          onPressed: () {
            ScaffoldMessenger.of(currentContext!).hideCurrentSnackBar();
          },
          label: EduConnectConstants.localization().cancel),
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
            '${EduConnectConstants.localization().there_is_an_error} ${state.error.message}',
          );
        }
    }
  }

  void loadingListener(BuildContext context, LoadingState state) {
    LoadingPopup.show(state.loading);
  }
}
