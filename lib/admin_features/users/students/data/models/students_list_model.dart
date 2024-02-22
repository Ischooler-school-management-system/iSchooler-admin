// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:collection/collection.dart';

import '../../../../../common/educonnect_model.dart';
import 'student_model.dart';

class StudentsListModel extends IschoolerListModel {
  const StudentsListModel({required super.items});
  factory StudentsListModel.empty() {
    return const StudentsListModel(items: []);
  }
  factory StudentsListModel.fromMap(Map map) {
    final List<StudentModel> items = List<StudentModel>.from(
      map['items'].map(
        (item) => StudentModel.fromMap(item),
      ),
    );
    return StudentsListModel(items: items);
  }
  @override
  StudentModel? getModelByName(String modelName) {
    StudentModel? firstWhereOrNull = (items as List<StudentModel>)
        .firstWhereOrNull((StudentModel item) => item.name == modelName);
    return firstWhereOrNull;
  }

  factory StudentsListModel.dummy() {
    return StudentsListModel(
        items: List.generate(3, (index) => StudentModel.dummy()));
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  @override
  List<Map<String, dynamic>> toDisplayList() {
    return items.map((item) => item.toDisplayMap()).toList();
  }

  @override
  StudentsListModel copyWith({
    List<IschoolerModel>? items,
  }) {
    return StudentsListModel(
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [items];
}
