import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/comon_features/responsive/responsive.dart';
import '../../../../common/comon_features/widgets/buttons/educonnect_button.dart';
import '../../../../common/comon_features/widgets/buttons/models/buttons_model.dart';
import '../../../../common/comon_features/widgets/educonnect_conditional_widget.dart';
import '../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../../common/educonnect_model.dart';
import '../../../../common/navigation/educonnect_navi.dart';
import '../../../classes/logic/instructors_list_cubit/classes_list_cubit.dart';
import '../../../grades/logic/instructors_list_cubit/grades_list_cubit.dart';
import '../../../users/admins/logic/admins_list_cubit/admins_list_cubit.dart';
import '../../../users/instructor/logic/instructors_list_cubit/instructors_list_cubit.dart';
import '../../../users/students/logic/students_list_cubit/students_list_cubit.dart';
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
    EduconnectNavigator.navigateToScreen(
      DashboardDetailsScreen<C>(),
    );
  }

  String screenTag() {
    if (C == StudentsListCubit) {
      return 'Student';
    } else if (C == AdminsListCubit) {
      return 'Admin';
    } else if (C == InstructorsListCubit) {
      return 'Instructor';
    } else if (C == GradesListCubit) {
      return 'Grade';
    } else if (C == ClassesListCubit) {
      return 'Class';
    } else {
      return '';
    } /* else if (C == SubjectsListCubit) {
    return 'Subject';
  } else if (C == WeeklySessionsListCubit) {
    return 'Weekly Session';
  } else if (C == WeeklyTimetablesListCubit) {
    return 'Weekly Timetable';
  } else if (C == ExamTypesListCubit) {
    return 'Exam Type';
  } else if (C == ExamsListCubit) {
    return 'Exam';
  } else if (C == ExamSessionsListCubit) {
    return 'Exam Session';
  } else if (C == ExamTimetablesListCubit) {
    return 'Exam Timetable';
  } else if (C == HomeworksListCubit) {
    return 'Homework';
  } else if (C == NewsListCubit) {
    return 'News';
  } */
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
      padding: const EdgeInsets.all(8),
      body: BlocBuilder<C, EduconnectState>(
        builder: (context, state) {
          EduconnectModelList educonnectAllModel = EduconnectModelList.empty();
          if (state.isLoaded()) {
            educonnectAllModel = state.educonnectAllModel;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addButton(),
              EduconnectConditionalWidget(
                condition: Responsive.isMobile(),
                whenTrue: DashboardMobileVeiw(
                  educonnectAllModel: educonnectAllModel,
                  onDeleteButtonPressed: onDeleteButtonPressed,
                  onEditButtonPressed: onEditButtonPressed,
                ),
                whenFalse: DashboardWebVeiw(
                  allUsers: educonnectAllModel,
                  onDeleteButtonPressed: onDeleteButtonPressed,
                  onEditButtonPressed: onEditButtonPressed,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  onEditButtonPressed(model) {
    /* SmartDialog.show(
      alignment: Alignment.center,
      builder: (context) => DashboardDetailsScreen<C>(currentData: model),
    ); */
    EduconnectNavigator.navigateToScreen(
      DashboardDetailsScreen<C>(currentData: model),
    );
  }

  onDeleteButtonPressed(model) {
    currentContext!.read<C>().deleteItem(model: model);
  }
}
