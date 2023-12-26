import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../features/error_handling/data/models/error_handling_model.dart';
import '../../features/error_handling/logic/cubit/error_handling_cubit.dart';
import '../../madpoly.dart';
import '../../style/educonnect_colors.dart';

// ignore: must_be_immutable
class MawjoodScreen extends StatelessWidget {
  final bool enableBackButton;
  final String tag;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool closeAppBackButton;
  final Widget? bottomNavigationBar;
  final Future<void> Function()? onRefresh;
  final bool isScrollable;
  final bool hasMinHeight;

  final FloatingActionButton? floatingActionButton;

  MawjoodScreen({
    super.key,
    required this.body,
    this.enableBackButton = false,
    this.appBar,
    this.tag = '',
    this.closeAppBackButton = false,
    this.bottomNavigationBar,
    this.onRefresh,
    this.isScrollable = false,
    this.hasMinHeight = false,
    this.floatingActionButton,
  });

  bool backButtonPressed = false;

  // Function to handle errors and refresh
  void errorListener(BuildContext context, ErrorHandlingState state,
      {Future<void> Function()? onRefresh}) {
    if (state.error.type == ErrorHandlingTypes.None) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      onRefresh!();
    }
  }

  Future<bool> onWillPopCloseApp() async {
    // Handle closing the app logic
    if (backButtonPressed) {
      SystemNavigator.pop();
    } else {
      SmartDialog.showToast(
          'MawjoodConstants.localization().press_back_again_to_close_the_app');
      backButtonPressed = true;
    }
    return false;
  }
/* 
  bool onWillPopBack(BuildContext context) {
    if (enableBackButton) {
      // Handle back button press logic
      context.read<AuthCubit>().onBackButtonPressed();

      Madpoly.print(
        'Going back...',
        developer: 'ziad',
        isLog: true,
        tag: tag,
      );
      return false;
    } else {
      return true;
    }
  }
 */
  // Function to build the body based on the presence of onRefresh
  Widget buildBody(BuildContext context) {
    return /* /*  */WillPopScope(
      onWillPop: closeAppBackButton
          ? onWillPopCloseApp
          : () async {
              return onWillPopBack(context);
            },
      child:  */onRefresh == null
          ? body
          : BlocListener<ErrorHandlingCubit, ErrorHandlingState>(
              listener: (context, state) {
                errorListener(context, state, onRefresh: onRefresh);
              },
              listenWhen: (previous, current) {
                return previous.error.createdAt != current.error.createdAt;
              },
              child: LiquidPullToRefresh(
                height: 70,
                animSpeedFactor: 2.5,
                springAnimationDurationInMilliseconds: 500,
                showChildOpacityTransition: false,
                color: MawjoodColors.light_blue,
                onRefresh: () {
                  Madpoly.print(
                    'onRefresh function is called',
                    tag: "MawjoodScreen > LiquidPullToRefresh",
                    developer: 'ziad',
                    isInspect: true,
                    isLog: true,
                  );
                  return onRefresh!();
                },
                child: body,
              ),
            // ),
    );
  }

  // Build method for the MawjoodScreen widget
  @override
  Widget build(BuildContext context) {
    // Build the main screen with necessary widgets
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: isScrollable
          ? LayoutBuilder(
              builder: (context, constraints) {
                // Enable scrolling within the screen
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: hasMinHeight
                          ? constraints.minHeight
                          : constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: buildBody(context), // Build the body
                    ),
                  ),
                );
              },
            )
          // Build the body
          : buildBody(context),
      floatingActionButton: floatingActionButton,
    );
  }
}
