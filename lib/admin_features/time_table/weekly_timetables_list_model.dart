// ignore_for_file: use_super_parameters, overridden_fields

import 'package:school_admin/admin_features/time_table/weekly_timetable_model.dart';
import 'package:school_admin/common/educonnect_model.dart';

class WeeklyTimetablesListModel extends EduconnectListModel {
  const WeeklyTimetablesListModel({required List<WeeklyTimetableModel> items})
      : super(items: items);

  factory WeeklyTimetablesListModel.empty() {
    return const WeeklyTimetablesListModel(items: []);
  }
  factory WeeklyTimetablesListModel.dummy() {
    return WeeklyTimetablesListModel(items: [
      WeeklyTimetableModel.empty(),
      WeeklyTimetableModel.empty(),
      WeeklyTimetableModel.empty(),
      // Add more instances as needed
    ]);
  }
  factory WeeklyTimetablesListModel.fromMap(Map map) {
    final List<WeeklyTimetableModel> items = List<WeeklyTimetableModel>.from(
      map['items'].map(
        (item) => WeeklyTimetableModel.fromMap(item),
      ),
    );
    return WeeklyTimetablesListModel(items: items);
  }
}
