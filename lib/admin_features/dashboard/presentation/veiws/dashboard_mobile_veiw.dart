import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../common/comon_features/widgets/educonnect_flexible_scroll_widget.dart';
import '../../../../common/comon_features/widgets/educonnect_small_view.dart';
import '../../../../common/educonnect_model.dart';
import '../../../users/user_model.dart';
import '../widgets/educonnect_dashboard_listtile.dart';

class DashboardMobileVeiw extends StatelessWidget {
  final EduconnectModelList educonnectAllModel;
  const DashboardMobileVeiw({super.key, required this.educonnectAllModel});

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
                return EduconnecDashboardListTile(
                  title: model.id,
                  isName: true,
                  // subtitle: '${model.gender} | ${model.phoneNumber}',
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            SmartDialog.showToast('id = ${model.id}, Delete');
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            SmartDialog.showToast('id = ${model.id}, Edit');
                            // EduconnectNavigator.navigateToScreen(edit)
                            if (model is UserModel) {
                              // navigateToUserDetails(model);
                            }
                          },
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
