import '../../../../../common/common_features/alert_handling/data/models/alert_handling_model.dart';
import '../../../../../common/common_features/alert_handling/data/repo/alert_handling_repo.dart';
import '../../../../../common/madpoly.dart';
import '../../../../../common/network/educonnect_network_helper.dart';
import '../../../../../common/network/educonnect_response.dart';
import '../../../../../common/network/educonnect_tables.dart';
import '../models/weekly_timetable_day_model.dart';

class WeeklyTimetableDayNetwork {
  final AlertHandlingRepository _alertHandlingRepository;

  WeeklyTimetableDayNetwork(AlertHandlingRepository alertHandlingRepository)
      : _alertHandlingRepository = alertHandlingRepository;

  Future<IschoolerResponse> getItem(
      {required WeeklyTimetableDayModel model}) async {
    IschoolerResponse response = IschoolerResponse.empty();
    try {
      Madpoly.print(
        'request will be sent is >>  getItem(), '
        'tableQueryData: weekly_timetable, '
        'model: $model',
        // inspectObject: tableQueryData,
        tag: 'weeklyTimetableDay_network > getItem',
        // color: MadpolyColor.purple,
        isLog: true,
        developer: "Ziad",
      );

      final Map<String, dynamic> query = await SupabaseCredentials.supabase
          .from('weekly_timetable_day')
          .select('*')
          .eq('weekly_timetable_id', model.weeklyTimetableId)
          .eq('weekday_id', model.weekdayId)
          // .not('weekly_timetab_day', 'is', 'null')
          .single();

      Madpoly.print(
        'query= ',
        inspectObject: query,
        color: MadpolyColor.green,
        tag: 'weeklyTimetableDay_network > getAllItems',
        developer: "Ziad",
      );

      response = IschoolerResponse(hasData: true, data: query);
    } catch (e) {
      _alertHandlingRepository.addError(
        e.toString(),
        AlertHandlingTypes.MajorUiError,
        tag: 'weekly_timetable_day_network > getAllData',
        // showToast: true,
      );
    }
    return response;
  }

  Future<IschoolerResponse> addItem(
      {required WeeklyTimetableDayModel model}) async {
    IschoolerResponse response = IschoolerResponse.empty();
    try {
      Map<String, dynamic> data = model.toMap();
      Madpoly.print(
        'request will be sent is >> insert(), '
        'table: weekly_timetable_day, '
        'data = $data',
        tag: 'weekly_timetable_day_network > addItem ',
        // color: MadpolyColor.purple,
        isLog: true,
        developer: "Ziad",
      );
      final query = await SupabaseCredentials.supabase
          .from('weekly_timetable_day')
          .insert(data)
          .select()
          .single();
      Madpoly.print(
        color: MadpolyColor.green,
        'query =',
        inspectObject: query,
        tag: 'weekly_timetable_day_network > addItem ',
        developer: "Ziad",
      );
      response = IschoolerResponse(hasData: true, data: query);

      // await response.doc(model.id).set(model.toMap());
    } catch (e) {
      _alertHandlingRepository.addError(
        // 'unable to add user',
        /* developerMessage: */ e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekly_timetable_day_network > addItem > catch',
        showToast: true,
      );
    }

    return response;
  }

  Future<bool> updateItem({required WeeklyTimetableDayModel model}) async {
    bool dataUpdated = false;
    // String? docName = addWithId ? model.id : null;
    try {
      DatabaseTable tableQueryData =
          IschoolerNetworkHelper.getTableQueryData(model);
      if (tableQueryData == DatabaseTable.empty()) {
        throw Exception(
          'tableQueryData = $tableQueryData, '
          'unable to update (model = $model) data',
        );
      }
      Map<String, dynamic> data = model.toMapFromChild();
      Madpoly.print(
        'request will be sent is >> update(), '
        'table: ${tableQueryData.tableName}, '
        'data = ',
        inspectObject: data,
        tag: 'weekly_timetable_day_network > update',
        // color: MadpolyColor.purple,
        isLog: true,
        developer: "Ziad",
      );
      final query = await SupabaseCredentials.supabase
          .from(tableQueryData.tableName)
          .update(data)
          .match(model.idToMap());
      Madpoly.print(
        'query= ',
        color: MadpolyColor.green,
        inspectObject: query,
        tag: 'weekly_timetable_day_network > update',
        developer: "Ziad",
      );
      // await response.doc(model.id).set(model.toMap());
      dataUpdated = true;
    } catch (e) {
      _alertHandlingRepository.addError(
        // 'unable to add user',
        /* developerMessage: */ e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekly_timetable_day_network > update > catch',
        showToast: true,
      );
    }

    return dataUpdated;
  }

  Future<bool> deleteItem({required WeeklyTimetableDayModel model}) async {
    bool dataDeleted = false;
    try {
      DatabaseTable tableQueryData =
          IschoolerNetworkHelper.getTableQueryData(model);
      if (tableQueryData == DatabaseTable.empty()) {
        throw Exception(
          'tableQueryData = $tableQueryData, '
          'unable to delete (model = $model) data',
        );
      }
      Madpoly.print(
        'request will be sent is >> delete(), '
        'tableQueryData: $tableQueryData, ',
        inspectObject: model,
        tag: 'weekly_timetable_day_network > deleteItem',
        isLog: true,
        // color: MadpolyColor.purple,
        developer: "Ziad",
      );
      final query = await SupabaseCredentials.supabase
          .from(tableQueryData.tableName)
          .delete()
          .eq('id', model.id);
      Madpoly.print(
        'query= ',
        inspectObject: query,
        color: MadpolyColor.green,
        tag: 'weekly_timetable_day_network > delete',
        developer: "Ziad",
      );

      dataDeleted = true;
    } catch (e) {
      _alertHandlingRepository.addError(
        'unable to add user',
        developerMessage: e.toString(),
        AlertHandlingTypes.ServerError,
        tag: 'weekly_timetable_day_network > delete > catch',
        showToast: true,
      );
    }

    return dataDeleted;
  }
}
