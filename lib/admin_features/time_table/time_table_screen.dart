import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../common/comon_features/widgets/educonnect_drop_down_widget.dart';
import '../../common/comon_features/widgets/educonnect_screen.dart';
import '../../common/educonnect_model.dart';
import '../../common/madpoly.dart';
import '../../common/network/educonnect_network_helper.dart';
import '../../common/style/educonnect_colors.dart';
import '../../common/style/educonnect_text_theme.dart';
import '../list_models.dart';
import '../weekly_timetable/data/models/weekly_timetable_model.dart';
import '../weekly_timetable/weekday/data/models/weekday_model.dart';
import '../weekly_timetable/weekly_session/data/models/weekly_session_model.dart';
import '../weekly_timetable/weekly_session/data/models/weekly_sessions_list_model.dart';

/* class ScheduledClass {
  String dateTime;
  String subjectName;
  String instructorName;

  ScheduledClass(this.dateTime, this.subjectName, this.instructorName);
}

List<ScheduledClass> generateClassList(DateTime startingDateTime, int count,
    Duration step, String subject, String instructor) {
  List<ScheduledClass> result = [];
  for (int i = 0; i < count; i++) {
    DateTime classDateTime = startingDateTime.add(step * i);
    result.add(ScheduledClass(
      EduconnectDateTimeHelper.timeFormat(classDateTime) ?? '',
      subject,
      instructor,
    ));
  }
  return result;
}
 */
class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

/* 


 // context.read<>(WeekdaysCubit).getAllItems();


//  context.read<WeeklyTimetableCubit>().getByClassId(classId);
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
class _TimeTableScreenState extends State<TimeTableScreen> {
  String classId = '1';
  WeekdayModel? selectedWeekday;
  WeeklyTimetableModel? timeTable;
  WeekdaysListModel weekdaysListModel = WeekdaysListModel.empty();
  // WeeklyTimetablesListModel weeklyTimetablesListModel =
  //     WeeklyTimetablesListModel.empty();
  // WeeklyTimetableWeekdayListModel weeklyTimetableWeekdayListModel =
  //     WeeklyTimetableWeekdayListModel.empty();
  WeeklySessionsListModel weeklySessionsListModel =
      WeeklySessionsListModel.empty();
  @override
  void initState() {
    super.initState();
    timetableResponseTest();
  }

  getTimetable(String id) async {}

  Future<void> timetableResponseTest() async {
    final Map<String, dynamic> weekday = await SupabaseCredentials.supabase
        .from('weekly_timetable')
        .select('*,class(*)')
        .eq('id', classId)
        .single();
    timeTable = WeeklyTimetableModel.fromMap(weekday);
// context.read<WeekdaysListCubit>().getAllItems();
    final List<Map<String, dynamic>> weekdays =
        await SupabaseCredentials.supabase.from('weekday').select();
    weekdaysListModel = WeekdaysListModel.fromMap({'items': weekdays});

    // final List<Map<String, dynamic>> weeklyTimetable = await SupabaseCredentials
    //     .supabase
    //     .from('weekly_timetable')
    //     .select('*,class(*)');
    // weeklyTimetablesListModel =
    //     WeeklyTimetablesListModel.fromMap({'items': weeklyTimetable});

    // final List<Map<String, dynamic>> weeklyTimetableDay =
    //     await SupabaseCredentials.supabase
    //         .from('weekly_timetable_day')
    //         .select('*');
    // weeklyTimetableWeekdayListModel =
    //     WeeklyTimetableWeekdayListModel.fromMap({'items': weeklyTimetableDay});

    setState(() {});
    // List<Map<String, dynamic>> weeklySessions =
    //     await weeklySessionsQueryMaker(classId: 1, weekdayId: 4);
  }

  Future<WeeklySessionsListModel> weeklySessionsQueryMaker(
      {required String classId, required String weekdayId}) async {
    final List<Map<String, dynamic>> weeklySessions = await SupabaseCredentials
        .supabase
        .from('weekly_sessions')
        .select('*,instructor_assignment(subject(id,name),instructor(id,name))'
            ',weekly_timetable_day(*,weekly_timetable(class_id))')
        .not('weekly_timetable_day', 'is', 'null')
        .eq('weekly_timetable_day.weekly_timetable.class_id', classId)
        .eq('weekly_timetable_day.weekday_id', weekdayId)
        .order('id', ascending: true);
    WeeklySessionsListModel responseModel =
        WeeklySessionsListModel.fromMap({'items': weeklySessions});
    Madpoly.print(
      'sessions = ',
      inspectObject: responseModel,
      tag: 'time_table_screen > ',
      developer: "Ziad",
    );
    return responseModel;
  }

  getSessions() async {
    if (selectedWeekday != null) {
      weeklySessionsListModel = await weeklySessionsQueryMaker(
          classId: classId, weekdayId: selectedWeekday!.id);
      if (timeTable != null) {
        weeklySessionsListModel =
            weeklySessionsListModel.setSessionsTiming(timeTable: timeTable!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    /*  List<ScheduledClass> sessionList = generateClassList(
        DateTime.now(), 9, const Duration(minutes: 30), "Math", "John Doe");
 */
    return EduconnectScreen(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            EduConnectDropdownWidget(
              // labelText: 'day',
              // value: ,
              hint: 'Monday',
              onChanged: (value) async {
                if (value != null && value != '') {
                  selectedWeekday = weekdaysListModel.getModelByName(value);
                  getSessions();
                  setState(() {});
                }
              },
              options: weekdaysListModel.getItemNames(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: weeklySessionsListModel.items.length,
                itemBuilder: (BuildContext context, int index) {
                  EduconnectModel item = weeklySessionsListModel.items[index];
                  if (item is WeeklySessionModel && timeTable != null) {
                    DateTime sessionDate =
                        DateTime.now().copyWith(hour: timeTable!.startTime);

                    return buildTimelineTile(
                      session: item,
                      dateTime: sessionDate,
                      isFirst: index == 0,
                      isLast: index == weeklySessionsListModel.items.length - 1,
                    );
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TimelineTile buildTimelineTile({
    required WeeklySessionModel session,
    required DateTime dateTime,
    hasIndicator = true,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return TimelineTile(
      hasIndicator: hasIndicator,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle:
          const IndicatorStyle(width: 10, color: EduconnectColors.blue),
      beforeLineStyle: const LineStyle(color: EduconnectColors.blue),
      alignment: TimelineAlign.manual,
      lineXY: 0.2,
      endChild: Container(
        decoration: BoxDecoration(
          color: EduconnectColors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(8),
        child: ListTile(
          title: Text(session.instructorAssignment.subjectModel!.name),
          subtitle: Text(session.instructorAssignment.instructor!.name),
          /*  trailing: EduconnectButton(
            button: EduconnectContainerButton(
              onPressed: () {},
              child: const Icon(
                Icons.more_vert_outlined,
              ),
            ),
          ), */
        ),
      ),
      startChild: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              session.startTime,
              style: EduconnectTextStyles.style14
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              session.endTime,
              style: EduconnectTextStyles.style12Blue
                  .copyWith(color: EduconnectColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
