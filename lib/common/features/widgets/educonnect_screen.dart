import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../features/auth/settings/language/language_bloc/language_bloc.dart';
import '../../educonnect_local_settings.dart';
import '../../features/error_handling/data/models/error_handling_model.dart';
import '../../features/error_handling/logic/cubit/error_handling_cubit.dart';
import '../../madpoly.dart';
import '../../navigation/educonnect_navi.dart';
import '../../style/educonnect_colors.dart';
import 'buttons/educonnect_button.dart';
import 'buttons/models/buttons_model.dart';

// ignore: must_be_immutable
class EduconnectScreen extends StatefulWidget {
  final bool enableBackButton;
  final String tag;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool closeAppBackButton;
  final Widget? bottomNavigationBar;
  final Future<void> Function()? onRefresh;
  final bool keepMobileView;
  final bool isScrollable;
  final bool hasMinHeight;
  final Widget? drawer;

  final FloatingActionButton? floatingActionButton;

  const EduconnectScreen({
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
    this.keepMobileView = false,
    this.drawer,
  });

  @override
  State<EduconnectScreen> createState() => _EduconnectScreenState();
}

class _EduconnectScreenState extends State<EduconnectScreen> {
  bool backButtonPressed = false;

  int selectedIndex = 0;
  /*  @override
  void initState() {
    super.initState();
    getCurrentLanguage();
  }
 */
  getCurrentLanguage() async {
    selectedIndex = await EduconnectLocalSettings.getCurrentLang();
  }

  // Function to handle errors and refresh
  void errorListener(BuildContext context, ErrorHandlingState state,
      {Future<void> Function()? onRefresh}) {
    if (state.error.type == ErrorHandlingTypes.None) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      onRefresh!();
    }
  }

  // Function to build the body based on the presence of onRefresh
  Widget buildBody(BuildContext context) {
    return widget.onRefresh == null
        ? widget.body
        : BlocListener<ErrorHandlingCubit, ErrorHandlingState>(
            listener: (context, state) {
              errorListener(context, state, onRefresh: widget.onRefresh);
            },
            listenWhen: (previous, current) {
              return previous.error.createdAt != current.error.createdAt;
            },
            child: LiquidPullToRefresh(
              height: 70,
              animSpeedFactor: 2.5,
              springAnimationDurationInMilliseconds: 500,
              showChildOpacityTransition: false,
              color: EduconnectColors.blue,
              onRefresh: () {
                Madpoly.print(
                  'onRefresh function is called',
                  tag: "EduconnectScreen > LiquidPullToRefresh",
                  developer: 'ziad',
                  isInspect: true,
                  isLog: true,
                );
                return widget.onRefresh!();
              },
              child: widget.body,
            ),
            // ),
          );
  }

  // Build method for the EduconnectScreen widget
  @override
  Widget build(BuildContext context) {
    // Build the main screen with necessary widgets
    double maxWidth =
        MediaQuery.of(currentContext!).size.width < 400 ? double.infinity : 400;
    var boxConstraints = BoxConstraints(maxWidth: maxWidth);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: widget.appBar /* ?? languageAppbar() */,
      bottomNavigationBar: widget.bottomNavigationBar,
      body: Center(
          child: Container(
              alignment: Alignment.center,
              constraints: widget.keepMobileView ? boxConstraints : null,
              child: widget.isScrollable
                  ? LayoutBuilder(
                      builder: (context, constraints) {
                        // Enable scrolling within the screen
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: constraints.maxWidth,
                              minHeight: widget.hasMinHeight
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
                  : buildBody(context))),
      floatingActionButton: widget.floatingActionButton,
      drawer: widget.drawer,
    );
  }

  AppBar languageAppbar() {
    bool isArabic = false;
    isArabic = selectedIndex == 0;
    String langSymbol = isArabic ? 'AR' : 'ENG';
    return AppBar(
      backgroundColor: Colors.transparent, // Set transparent background color
      elevation: 0, // Remove shadow
      actions: [
        EduconnectButton(
          button: EduconnectTextButton(
            onPressed: () {
              /// arabic : 0
              /// english : 1
              /// on press will toggle the current lang with the other
              selectedIndex = isArabic ? 1 : 0;

              EduconnectLocalSettings.saveCurrentLang(selectedIndex);

              BlocProvider.of<LangBloc>(currentContext!)
                  .add(UpdateLangEvent(selectedIndex));
              setState(() {});
            },
            textButton: langSymbol,
          ),
        ),
      ],
    );
  }
}
