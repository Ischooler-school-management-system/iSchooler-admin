import 'package:flutter/material.dart';

import '../../../../common/comon_features/widgets/educonnect_flexible_scroll_widget.dart';
import '../../../../common/comon_features/widgets/educonnect_small_view.dart';
import '../../../../common/educonnect_model.dart';
import '../widgets/educonnect_dashboard_listtile.dart';

class DashboardMobileVeiw extends StatelessWidget {
  final EduconnectModelList educonnectAllModel;
  final Function(EduconnectModel model)? onDeleteButtonPressed;
  final Function(EduconnectModel model)? onEditButtonPressed;
  const DashboardMobileVeiw({
    super.key,
    required this.educonnectAllModel,
    this.onDeleteButtonPressed,
    this.onEditButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return EduconnectSmallView(
      isCenter: false,
      child: EduconnectFlexibleScrollWidget(
        enableScrolling: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...educonnectAllModel.items.map(
              (EduconnectModel model) {
                List displayMap = model.toDisplayMap().values.toList();
                String? subtitleString =
                    (displayMap[1] != null && displayMap[1] is String)
                        ? displayMap[1]
                        : null;
                // if (displayMap.length > 1) {
                //   subtitleString += ' | ${displayMap[2]}';
                // }
                return EduconnecDashboardListTile(
                  title: displayMap[0],
                  subtitle: subtitleString,
                  isName: true,
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: onEditButtonPressed == null
                              ? null
                              : () => onEditButtonPressed!(model),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: onDeleteButtonPressed == null
                              ? null
                              : () => onDeleteButtonPressed!(model),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
