import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/common_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/common_features/widgets/educonnect_screen.dart';
import '../../../../../common/navigation/educonnect_navi.dart';
import '../../../../classes/data/models/class_model.dart';
import '../../../../cubits.dart';
import '../../data/models/weekly_timetable_model.dart';
import '../../../weekly_session/data/models/weekly_sessions_list_model.dart';
import '../../logic/cubit/weekly_timetable_cubit.dart';
import '../views/time_table_loaded_view.dart';
import '../widgets/time_table_details_form.dart';

class TimeTableScreen extends StatefulWidget {
  final ClassModel classData;

  const TimeTableScreen({super.key, required this.classData});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  WeeklySessionsListModel weeklySessionsListModel =
      WeeklySessionsListModel.empty();
  @override
  void initState() {
    super.initState();
    // timetableResponseTest();
    context
        .read<WeeklyTimetableCubit>()
        .getItemByClassId(classId: widget.classData.id);
  }

/* 
 // context.read<>(WeekdaysCubit).getAllItems();


//  context.read<WeeklyTimetableCubit>().getByClassId(widget.classId);
//  context.read<WeeklyTimetableCubit>().addItem(model);
//  context.read<WeeklyTimetableCubit>().updateItem(model.id);
//  context.read<WeeklyTimetableCubit>().deleteItem(model.id);

 
//  context.read<WeeklySessionsCubit>().getAllItems(class id ,weekday id);
 context.read<WeeklySessionsCubit>().addItem(model);
 context.read<WeeklySessionsCubit>().updateItem(model);
 context.read<WeeklySessionsCubit>().deleteItem(model.id);
 context.read<WeeklySessionsCubit>().deleteAll(weekly_timetable_day_id);


 context.read<WeeklyTimetableDaysCubit>().getItem(weekly_timetable_id , weekday_id);
 context.read<WeeklyTimetableDaysCubit>().addItem(weekly_timetable_id , weekday_id);
 context.read<WeeklyTimetableDaysCubit>().deleteItem(weekly_timetable_id , weekday_id);
 
 */
  @override
  Widget build(BuildContext context) {
    return IschoolerScreen(
      showAppbar: true,
      body: BlocBuilder<WeeklyTimetableCubit, WeeklyTimetableState>(
        builder: (context, state) {
          WeeklyTimetableModel? timeTable;
          if (state.status == IschoolerStatus.loaded &&
              state.weeklyTimetableModel.id != '-1') {
            timeTable = state.weeklyTimetableModel;
          }
          if (timeTable != null) {
            return TimeTableLoadedView(timeTable: timeTable);
          } else {
            return Center(
              child: IschoolerButton(
                button: IschoolerElevatedButton(
                  onPressed: onCreateTableButtonPressed,
                  text: 'create time table',
                ),
              ),
            );
          }
        },
      ),
    );
  }

  onCreateTableButtonPressed() {
    IschoolerNavigator.navigateToScreen(
        TimeTableDetailsForm(currentClassData: widget.classData));
  }
}
