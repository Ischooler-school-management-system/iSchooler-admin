// ignore_for_file: use_super_parameters, overridden_fields

import 'package:collection/collection.dart';

import '../../../../../common/educonnect_model.dart';
import 'weekday_model.dart';

class WeekdaysListModel extends IschoolerListModel {
  const WeekdaysListModel({required super.items});
  factory WeekdaysListModel.empty() {
    return const WeekdaysListModel(items: []);
  }
  factory WeekdaysListModel.dummy() {
    return WeekdaysListModel(items: [
      WeekdayModel.empty(),
      WeekdayModel.empty(),
      WeekdayModel.empty(),
      // Add more instances as needed
    ]);
  }

  @override
  WeekdayModel? getModelByName(String modelName) {
    WeekdayModel? firstWhereOrNull = (items as List<WeekdayModel>)
        .firstWhereOrNull((WeekdayModel item) => item.name == modelName);
    return firstWhereOrNull;
  }

  factory WeekdaysListModel.fromMap(Map map) {
    final List<WeekdayModel> items = List<WeekdayModel>.from(
      map['items'].map(
        (item) => WeekdayModel.fromMap(item),
      ),
    );
    return WeekdaysListModel(items: items);
  }
  /* factory WeekdaysListModel.fromMap(List<dynamic> json) {
    List<WeekdayModel> weekdays =
        json.map((dayJson) => WeekdayModel.fromMap(dayJson)).toList();
    return WeekdaysListModel(weekdays: weekdays);
  } */

  /*  List<Map<String, dynamic>> toMap() {
    return weekdays.map((weekday) => weekday.toMap()).toList();
  } */
}
