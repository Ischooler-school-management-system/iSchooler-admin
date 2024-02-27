import 'package:flutter_test/flutter_test.dart';
import 'package:ischooler_admin/admin_features/homework/data/models/homework_model.dart';
import 'package:ischooler_admin/admin_features/homework/data/models/homeworks_list_model.dart';
import 'package:ischooler_admin/admin_features/models.dart';
import 'package:ischooler_admin/admin_features/list_models.dart';
import 'package:ischooler_admin/admin_features/calender/weekly_session/data/models/weekly_session_model.dart';
import 'package:ischooler_admin/admin_features/calender/weekly_session/data/models/weekly_sessions_list_model.dart';
import 'package:ischooler_admin/admin_features/calender/weekly_timetable/data/models/weekly_timetable_model.dart';
import 'package:ischooler_admin/common/network/ischooler_network_helper.dart';

void main() {
  test('Test getTableQueryData method for all models', () {
    final modelsToTest = [
      AdminModel.dummy(),
      AdminsListModel.dummy(),
      InstructorModel.dummy(),
      InstructorsListModel.dummy(), StudentModel.dummy(),
      StudentsListModel.dummy(),
      UserModel.dummy(),
      UsersListModel.dummy(),
      GradeModel.dummy(),
      GradesListModel.dummy(),
      ClassModel.dummy(),
      ClassesListModel.dummy(),
      SubjectModel.dummy(),
      SubjectsListModel.dummy(),
      WeeklySessionModel.dummy(),
      WeeklySessionsListModel.dummy(),
      WeeklyTimetableModel.dummy(),
      WeeklyTimetablesListModel.dummy(),
      ExamTypeModel.dummy(),
      ExamTypesListModel.dummy(),
      ExamModel.dummy(),
      ExamsListModel.dummy(),
      ExamSessionModel.dummy(),
      ExamSessionsListModel.dummy(),
      ExamTimetableModel.dummy(),
      ExamTimetablesListModel.dummy(),
      HomeworkModel.dummy(),
      HomeworksListModel.dummy(),
      NewsModel.dummy(),
      NewsListModel.dummy(),
      // UserRoleModel.dummy(),
      // UserRolesListModel.dummy(),
      // AdminRoleModel.dummy(),
      // AdminRolesListModel.dummy(),
      // InstructorAssignmentModel.dummy(),
      // InstructorAssignmentsListModel.dummy(),
      // Add more model instances as needed
    ];

    for (final model in modelsToTest) {
      final result = IschoolerNetworkHelper.getTableQueryData(model);
      print('${model.runtimeType}: $result');
    }
  });
}
