// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_super_parameters, overridden_fields

import 'package:school_admin/common/educonnect_model.dart';

class WeekdayModel extends EduconnectModel {
  final bool isDayOff;

  const WeekdayModel({
    required super.id,
    required super.name,
    required this.isDayOff,
  });
  factory WeekdayModel.empty() {
    return const WeekdayModel(
      id: '-1',
      name: '',
      isDayOff: true,
    );
  }

  factory WeekdayModel.dummy() {
    return const WeekdayModel(
      id: '1',
      name: 'Sample Day',
      isDayOff: true,
    );
  }

  factory WeekdayModel.fromMap(Map<String, dynamic> map) {
    EduconnectModel educonnectModel = EduconnectModel.fromMap(map);
    return WeekdayModel(
      id: educonnectModel.id,
      name: educonnectModel.name,
      isDayOff: map['is_day_off'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'is_day_off': isDayOff,
    };
  }

  @override
  String toString() => 'WeekdayModel(${super.toString()}, isDayOff: $isDayOff)';
}
