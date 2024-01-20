import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../common/comon_features/responsive/responsive.dart';
import '../../../../common/comon_features/widgets/buttons/educonnect_button.dart';
import '../../../../common/comon_features/widgets/buttons/models/buttons_model.dart';
import '../../../../common/comon_features/widgets/educonnect_conditional_widget.dart';
import '../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../../common/educonnect_model.dart';
import '../../../users/admins/logic/all_admins_cubit/admins_list_cubit.dart';
import '../../../users/students/logic/all_students_cubit/students_list_cubit.dart';
import '../../logic/cubit/all_cubit.dart';
import '../veiws/dashboard_mobile_veiw.dart';
import '../veiws/dashboard_web_veiw.dart';
import 'dashboard_details_screen.dart';

class DashboardScreen<C extends EduconnectCubit> extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen<C>> createState() => _DashboardScreenState<C>();
}

class _DashboardScreenState<C extends EduconnectCubit>
    extends State<DashboardScreen<C>> {
  @override
  void initState() {
    super.initState();
    context.read<C>().getAllItems();
  }

  int limit = 0;

  onAddButtonPressed() {
    SmartDialog.show(
      alignment: Alignment.center,
      builder: (context) => DashboardDetailsScreen<C>(),
    );
  }

  String screenTag() {
    if (C == AllStudentsCubit) {
      return 'Student';
    } else if (C == AllAdminsCubit) {
      return 'Admin';
    } else {
      return '';
    }
  }

  EduconnectButton addButton() {
    return EduconnectButton(
      button: EduconnectElevatedButton(
        onPressed: onAddButtonPressed,
        text: 'Add ${screenTag()}',
        width: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      // enableScrolling: Responsive.isMobile(),
      // enableflexibleScrolling: true,

      padding: const EdgeInsets.all(8),
      body: BlocBuilder<C, EduconnectState>(
        builder: (context, state) {
          EduconnectModelList educonnectAllModel = EduconnectModelList.empty();
          // AllStudentsModel allStudentsModel = AllStudentsModel(
          // items: List.generate(20, (index) => studentModel));
          if (state.isLoaded()) {
            educonnectAllModel = state.educonnectAllModel;
            // .copyWith(items: state.educonnectAllModel.items.repeat(20));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addButton(),
              EduconnectConditionalWidget(
                condition: Responsive.isMobile(),
                whenTrue:
                    DashboardMobileVeiw(educonnectAllModel: educonnectAllModel),
                whenFalse: DashboardWebVeiw<C>(
                  allUsers: educonnectAllModel,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
