// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../all_users_model.dart';
import 'student_model.dart';

class AllStudentsModel extends AllUsersModel {
  @override
  final List<StudentModel> items;

  const AllStudentsModel({required this.items}) : super(items: items);
  factory AllStudentsModel.empty() {
    return const AllStudentsModel(items: []);
  }
  factory AllStudentsModel.fromMap(Map map) {
    final List<StudentModel> items = List<StudentModel>.from(
      map['items'].map(
        (item) => StudentModel.fromMap(item),
      ),
    );
    return AllStudentsModel(items: items);
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
  List<Object> get props => [items];
}
