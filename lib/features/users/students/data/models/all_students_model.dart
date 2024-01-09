// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:school_admin/features/users/students/data/models/student_model.dart';

class AllStudentsModel extends Equatable {
  final List<StudentModel> items;

  const AllStudentsModel({required this.items});
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
  List<Object> get props => [items];
}
