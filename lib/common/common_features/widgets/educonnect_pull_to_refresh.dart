import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../alert_handling/data/models/alert_handling_model.dart';
import '../../common_features/alert_handling/logic/cubit/error_handling_cubit.dart';
import '../../madpoly.dart';
import '../../style/educonnect_colors.dart';
import 'educonnect_conditional_widget.dart';

class IschoolerPullToRefresh extends StatelessWidget {
  final Future<void> Function()? onRefresh;
  final Widget child;

  const IschoolerPullToRefresh({
    super.key,
    this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IschoolerConditionalWidget(
      condition: onRefresh == null,
      whenTrue: child,
      whenFalse: BlocListener<ErrorHandlingCubit, ErrorHandlingState>(
        listener: (context, state) {
          if (state.error.type == AlertHandlingTypes.None) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            onRefresh!();
          }
        },
        listenWhen: (previous, current) {
          return previous.error.createdAt != current.error.createdAt;
        },
        child: LiquidPullToRefresh(
          height: 70,
          animSpeedFactor: 2.5,
          springAnimationDurationInMilliseconds: 500,
          showChildOpacityTransition: false,
          color: IschoolerColors.blue,
          onRefresh: () {
            Madpoly.print(
              'onRefresh function is called',
              tag: "IschoolerScreen > LiquidPullToRefresh",
              developer: 'ziad',
            );
            return onRefresh!();
          },
          child: child,
        ),
      ),
    );
  }
}
