import 'package:flutter/material.dart';

import 'ischooler_flexible_scroll_widget.dart';
import 'ischooler_pull_to_refresh.dart';
import 'ischooler_small_view.dart';

// ignore: must_be_immutable
class IschoolerScreen extends StatelessWidget {
  final bool enableBackButton;
  final String tag;
  final PreferredSizeWidget? appBar;
  final bool showAppBar;
  final Widget? body;
  final bool closeAppBackButton;
  final Widget? bottomNavigationBar;
  final Future<void> Function()? onRefresh;
  final bool keepMobileView;
  final bool enableFlexibleScrolling;
  final bool enableScrolling;
  final bool hasMinHeight;
  final bool extendBodyBehindAppBar;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Alignment? alignment;
  final Widget? drawer;

  final FloatingActionButton? floatingActionButton;

  const IschoolerScreen({
    super.key,
    this.body,
    this.enableBackButton = false,
    this.appBar,
    this.tag = '',
    this.closeAppBackButton = false,
    this.bottomNavigationBar,
    this.onRefresh,
    this.enableFlexibleScrolling = false,
    this.enableScrolling = false,
    this.hasMinHeight = false,
    this.keepMobileView = false,
    this.extendBodyBehindAppBar = false,
    this.drawer,
    this.floatingActionButton,
    this.padding,
    this.margin,
    this.alignment,
    this.showAppBar = false,
  });

  // Build method for the IschoolerScreen widget
  @override
  Widget build(BuildContext context) {
    // Build the main screen with necessary widgets
    return Scaffold(
      // key: _key,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      // appBar: appBar /* ?? languageAppbar() */,
      appBar: newMethod(context),
      bottomNavigationBar: bottomNavigationBar,
      body: body != null
          ? Container(
              padding: padding,
              margin: margin,
              alignment: alignment,
              child: IschoolerSmallView(
                keepMobileView: keepMobileView,
                child: IschoolerFlexibleScrollWidget(
                  hasMinHeight: hasMinHeight,
                  enableflexibleScrolling: enableFlexibleScrolling,
                  enableScrolling: enableScrolling,
                  child: IschoolerPullToRefresh(
                    onRefresh: onRefresh,
                    child: body!,
                  ),
                ),
              ),
            )
          : null,
      floatingActionButton: floatingActionButton,
      drawer: drawer,
    );
  }

  PreferredSizeWidget? newMethod(BuildContext context) {
    if (showAppBar && MediaQuery.of(context).size.width < 600) {
      return appBar ??
          AppBar(
            backgroundColor: Colors.transparent,
          );
    } else {
      return null;
    }
  }
}
