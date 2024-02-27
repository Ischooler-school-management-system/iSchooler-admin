import 'package:flutter/material.dart';

import '../../../../common/common_features/widgets/educonnect_small_view.dart';
import '../../../../common/educonnect_model.dart';
import '../widgets/educonnect_dashboard_listtile.dart';

class DashboardMobileview extends StatelessWidget {
  final IschoolerListModel educonnectAllModel;
  final Function(IschoolerModel model)? onDeleteButtonPressed;
  final Function(IschoolerModel model)? onEditButtonPressed;
  const DashboardMobileview({
    super.key,
    required this.educonnectAllModel,
    this.onDeleteButtonPressed,
    this.onEditButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    List<IschoolerModel> list = (educonnectAllModel.items);
    // var list = (educonnectAllModel.items).repeat(5);
    return Expanded(
      child: IschoolerSmallView(
        isCenter: false,
        child: ListView.builder(
          // crossAxisAlignment: CrossAxisAlignment.start,
          itemCount: list.length,
          itemBuilder: (context, index) {
            IschoolerModel model = list[index];
            List displayMap = model.toDisplayMap().values.toList();
            String? subtitleString;
            if ((displayMap[1] != null && displayMap[1] is String)) {
              subtitleString = displayMap[1].toString();
            } else {
              subtitleString = null;
            }
            if (subtitleString != null && displayMap.length > 2) {
              subtitleString += ' | ${displayMap[2]}';
            }
            return EduconnecDashboardListTile(
              title: displayMap[0] ?? '',
              subtitle: subtitleString,
              isName: true,
              onTap: onEditButtonPressed == null
                  ? null
                  : () => onEditButtonPressed!(model),
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
      ),
    );
  }
}