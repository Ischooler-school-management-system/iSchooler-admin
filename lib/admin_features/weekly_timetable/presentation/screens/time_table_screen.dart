import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/comon_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../cubits.dart';
import '../../data/models/weekly_timetable_model.dart';
import '../../logic/cubit/weekly_timetable_cubit.dart';
import '../../weekly_session/data/models/weekly_sessions_list_model.dart';
import '../views/time_table_loaded_veiw.dart';

class TimeTableScreen extends StatefulWidget {
  final String classId;

  const TimeTableScreen({super.key, required this.classId});

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
        .getItemByClassId(classId: widget.classId);
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
    return EduconnectScreen(
      body: BlocBuilder<WeeklyTimetableCubit, WeeklyTimetableState>(
        builder: (context, state) {
          WeeklyTimetableModel? timeTable;
          if (state.status == EduconnectStatus.loaded &&
              state.weeklyTimetableModel.id != '-1') {
            timeTable = state.weeklyTimetableModel;
          }
          if (timeTable != null) {
            return TimeTableLoadedVeiw(timeTable: timeTable);
          } else {
            return Center(
              child: EduconnectButton(
                button: EduconnectElevatedButton(
                  onPressed: () {},
                  text: 'create time table',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
