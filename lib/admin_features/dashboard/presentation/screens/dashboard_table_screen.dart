import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../logic/cubit/all_cubit.dart';
import '../../../../common/comon_features/responsive/responsive.dart';
import '../../../../common/comon_features/widgets/buttons/educonnect_button.dart';
import '../../../../common/comon_features/widgets/buttons/models/buttons_model.dart';
import '../../../../common/comon_features/widgets/educonnect_conditional_widget.dart';
import '../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../../common/educonnect_model.dart';
import '../veiws/all_users_web_veiw.dart';
// import '../../data/models/all_students_model.dart';
import '../../../users/students/presentation/screens/student_details_screen.dart';

class DashboardTableScreen<C extends EduconnectCubit> extends StatefulWidget {
  const DashboardTableScreen({super.key});

  @override
  State<DashboardTableScreen<C>> createState() =>
      _DashboardTableScreenState<C>();
}

class _DashboardTableScreenState<C extends EduconnectCubit>
    extends State<DashboardTableScreen<C>> {
  @override
  void initState() {
    super.initState();
    context.read<C>().getAllData();
  }

  int limit = 0;

  onAddButtonPressed() {
    SmartDialog.show(
      alignment: Alignment.center,
      builder: (context) => const StudentDetailsScreen(),
    );
  }

  EduconnectButton addButton() {
    return EduconnectButton(
      button: EduconnectElevatedButton(
        onPressed: onAddButtonPressed,
        text: 'Add Student',
        width: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      enableScrolling: Responsive.isMobile(),
      // enableflexibleScrolling: true,

      padding: const EdgeInsets.all(8),
      body: BlocBuilder<C, EduconnectState>(
        builder: (context, state) {
          EduconnectAllModel educonnectAllModel = EduconnectAllModel.empty();
          // AllStudentsModel allStudentsModel = AllStudentsModel(
          // items: List.generate(20, (index) => studentModel));
          if (state.isLoaded()) {
            educonnectAllModel = state.educonnectAllModel;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addButton(),
              Expanded(
                child: EduconnectConditionalWidget(
                  condition: Responsive.isMobile(),
                  // whenTrue: AllStudentsMobileVeiw(
                  // studentList: educonnectAllModel.items ),
                  whenFalse: AllUsersWebVeiw(
                    allUsers: educonnectAllModel,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
