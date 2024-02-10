import 'package:flutter/material.dart';

import '../../../../common/comon_features/widgets/educonnect_flexible_scroll_widget.dart';
import '../../../../common/comon_features/widgets/educonnect_small_view.dart';
import '../../../../common/educonnect_model.dart';
import '../../../users/admins/data/models/admin_model.dart';
import '../../../users/instructor/data/models/instructor_model.dart';
import '../../../users/students/data/models/student_model.dart';
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
                if (this is StudentModel) {
                  model = (model as StudentModel);
                } else if (this is AdminModel) {
                  model = (model as AdminModel);
                } else if (this is InstructorModel) {
                  model = (model as InstructorModel);
                }
                return EduconnecDashboardListTile(
                  title: model.name,
                  subtitle: model.id,
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
