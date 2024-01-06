import 'package:flutter/material.dart';

import 'educonnect_flexible_scroll_widget.dart';
import 'educonnect_pull_to_refresh.dart';
import 'educonnect_small_view.dart';

// ignore: must_be_immutable
class EduconnectScreen extends StatelessWidget {
  final bool enableBackButton;
  final String tag;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool closeAppBackButton;
  final Widget? bottomNavigationBar;
  final Future<void> Function()? onRefresh;
  final bool keepMobileView;
  final bool enableflexibleScrolling;
  final bool enableScrolling;
  final bool hasMinHeight;
  final bool extendBodyBehindAppBar;
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
    this.enableflexibleScrolling = false,
    this.enableScrolling = false,
    this.hasMinHeight = false,
    this.keepMobileView = false,
    this.extendBodyBehindAppBar = false,
    this.drawer,
    this.floatingActionButton,
  });

  // Build method for the EduconnectScreen widget
  @override
  Widget build(BuildContext context) {
    // Build the main screen with necessary widgets
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBar /* ?? languageAppbar() */,
      bottomNavigationBar: bottomNavigationBar,
      body: EduconnectSmallView(
        keepMobileView: keepMobileView,
        child: EduconnectFlexibleScrollWidget(
          hasMinHeight: hasMinHeight,
          enableflexibleScrolling: enableflexibleScrolling,
          enableScrolling: enableScrolling,
          child: EduconnectPullToRefresh(
            onRefresh: onRefresh,
            child: body,
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
      drawer: drawer,
    );
  }
}
