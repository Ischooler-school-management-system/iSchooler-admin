import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/comon_features/responsive/responsive.dart';
import '../../../../common/comon_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../common/comon_features/widgets/educonnect_conditional_widget.dart';
import '../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../../common/educonnect_model.dart';
import '../../../../common/navigation/educonnect_navi.dart';
import '../../../cubits.dart';
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
    getDataRequest();
  }

  void getDataRequest() {
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
    } else if (C == AdminRolesListCubit) {
      return 'Admin Roles';
    } else if (C == InstructorsListCubit) {
      return 'Instructor';
    } else if (C == InstructorAssignmentsListCubit) {
      return 'Instructor Assignments';
    } else if (C == GradesListCubit) {
      return 'Grade';
    } else if (C == ClassesListCubit) {
      return 'Class';
    } else if (C == SubjectsListCubit) {
      return 'Subject';
    } else {
      return '';
    } /* else if (C == WeeklySessionsListCubit) {
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
      onRefresh: () async => getDataRequest(),
      padding: const EdgeInsets.all(8),
      body: BlocBuilder<C, EduconnectState>(
        builder: (context, state) {
          EduconnectListModel educonnectAllModel = EduconnectListModel.empty();
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
      DashboardDetailsScreen<C>(
        currentData: model,
      ),
    );
  }

  onDeleteButtonPressed(model) {
    currentContext!.read<C>().deleteItem(model: model);
  }
}
