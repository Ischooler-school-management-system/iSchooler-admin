import 'package:flutter/material.dart';

import 'admin_features/classes/data/models/tst.dart';

class TestScreen extends StatelessWidget {
  final GradesService gradesService = GradesService();
  final ClassesService classesService = ClassesService();
  final StudentsService studentsService = StudentsService();

  TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore CRUD Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await gradesService.addGrade('New Grade');
              },
              child: const Text('Add Grade'),
            ),
            ElevatedButton(
              onPressed: () async {
                final grades = await gradesService.getGrades().first;
                final firstGradeId = grades.docs.first.id;
                await classesService.addClassToGrade(firstGradeId, 'New Class');
              },
              child: const Text('Add Class to First Grade'),
            ),
            ElevatedButton(
              onPressed: () async {
                final grades = await gradesService.getGrades().first;
                final firstGradeId = grades.docs.first.id;
                final classes =
                    await classesService.getClassesForGrade(firstGradeId).first;
                final firstClassId = classes.docs.first.id;
                await classesService.updateClass(
                    firstGradeId, firstClassId, 'Updated Class Name');
              },
              child: const Text('Update First Class Name'),
            ),
            ElevatedButton(
              onPressed: () async {
                final grades = await gradesService.getGrades().first;
                final firstGradeId = grades.docs.first.id;
                final classes =
                    await classesService.getClassesForGrade(firstGradeId).first;
                final firstClassId = classes.docs.first.id;
                await classesService.deleteClass(firstGradeId, firstClassId);
              },
              child: const Text('Delete First Class'),
            ),
            ElevatedButton(
              onPressed: () async {
                final students = await studentsService.getStudents().first;
                final firstStudentId = students.docs.first.id;
                await studentsService.updateStudent(
                    firstStudentId, 'Updated Student Name');
              },
              child: const Text('Update First Student Name'),
            ),
            ElevatedButton(
              onPressed: () async {
                final students = await studentsService.getStudents().first;
                final firstStudentId = students.docs.first.id;
                await studentsService.deleteStudent(firstStudentId);
              },
              child: const Text('Delete First Student'),
            ),
          ],
        ),
      ),
    );
  }
}
