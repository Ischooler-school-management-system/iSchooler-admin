import 'package:flutter/material.dart';

import '../../../../../../common/madpoly.dart';
import '../../../../educonnect_dashboard_listtile.dart';
import '../../../data/models/student_model.dart';

class AllStudentsMobileVeiw extends StatelessWidget {
  final List<StudentModel> studentList;
  const AllStudentsMobileVeiw({super.key, required this.studentList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...studentList.map(
            (student) {
              return EduconnecDashboardListTile(
                title: student.displayName,
                isName: true,
                subtitle: '${student.gender} | ${student.phoneNumber}',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Handle edit button press
                        Madpoly.print('Edit button pressed for Item ');
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // Handle delete button press
                        Madpoly.print('Delete button pressed for Item ');
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
