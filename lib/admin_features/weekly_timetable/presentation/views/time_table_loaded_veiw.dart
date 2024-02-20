import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/madpoly.dart';
import '../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../data/models/weekly_timetable_model.dart';
import '../../weekday/data/models/weekday_model.dart';
import '../../weekday/logic/cubit/weekday_cubit.dart';
import '../../weekly_session/data/models/weekly_sessions_list_model.dart';
import '../../weekly_session/logic/cubit/weekly_sessions_cubit.dart';
import '../widgets/day_table_widget.dart';

class TimeTableLoadedVeiw extends StatefulWidget {
  final WeeklyTimetableModel timeTable;

  const TimeTableLoadedVeiw({super.key, required this.timeTable});

  @override
  State<TimeTableLoadedVeiw> createState() => _TimeTableLoadedVeiwState();
}

class _TimeTableLoadedVeiwState extends State<TimeTableLoadedVeiw> {
  WeekdayModel selectedWeekday = WeekdayModel.empty();
  // WeekdaysListModel weekdaysListModel = WeekdaysListModel.empty();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'time_table_loaded_veiw > ',
      developer: "Ziad",
    );
    return BlocBuilder<WeeklySessionsCubit, WeeklySessionsState>(
      builder: (context, state) {
        WeeklySessionsListModel weeklySessionsListModel =
            WeeklySessionsListModel.empty();
        if (state.status == EduconnectStatus.loaded &&
            state.educonnectAllModel is WeeklySessionsListModel) {
          weeklySessionsListModel =
              state.educonnectAllModel as WeeklySessionsListModel;
          weeklySessionsListModel = weeklySessionsListModel.setSessionsTiming(
              timeTable: widget.timeTable);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DashboardDropDownWidget<WeekdaysCubit>(
                onChanged: (weekday) async {
                  Madpoly.print(
                    'weekday = $weekday',
                    tag: 'time_table_loaded_veiw > ',
                    developer: "Ziad",
                  );
                  if (weekday is WeekdayModel) {
                    selectedWeekday = weekday;
                    context.read<WeeklySessionsCubit>().getAllItems(
                          classId: widget.timeTable.classId,
                          weekdayId: weekday.id,
                        );
                    setState(() {});
                  }
                },
                hint: 'select a day',
              ),
              if (selectedWeekday.isDayOff)
                Expanded(
                  child: Center(
                    child: Text(selectedWeekday.name != ''
                        ? '${selectedWeekday.name} is Day off'
                        : 'No day selected'),
                  ),
                )
              else
                Expanded(
                  child: DayTableWidget(
                    weeklySessionsListModel: weeklySessionsListModel,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
