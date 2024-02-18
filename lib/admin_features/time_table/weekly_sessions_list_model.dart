// ignore_for_file: use_super_parameters, overridden_fields

import 'package:school_admin/admin_features/time_table/weekly_session_model.dart';
import 'package:school_admin/admin_features/time_table/weekly_timetable_model.dart';
import 'package:school_admin/common/educonnect_model.dart';

class WeeklySessionsListModel extends EduconnectListModel {
  const WeeklySessionsListModel({required List<WeeklySessionModel> items})
      : super(items: items);

  factory WeeklySessionsListModel.empty() {
    return const WeeklySessionsListModel(items: []);
  }
  factory WeeklySessionsListModel.dummy() {
    return WeeklySessionsListModel(items: [
      WeeklySessionModel.dummy(),
      WeeklySessionModel.dummy(),
      WeeklySessionModel.dummy(),
      WeeklySessionModel.dummy(),
    ]);
  }

  factory WeeklySessionsListModel.fromMap(Map map) {
    final List<WeeklySessionModel> items = List<WeeklySessionModel>.from(
      map['items'].map(
        (item) => WeeklySessionModel.fromMap(item),
      ),
    );
    return WeeklySessionsListModel(items: items);
  }
}
