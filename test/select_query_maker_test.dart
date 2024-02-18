import 'package:flutter_test/flutter_test.dart';
import 'package:school_admin/admin_features/models.dart';
import 'package:school_admin/admin_features/list_models.dart';
import 'package:school_admin/admin_features/time_table/weekly_session_model.dart';
import 'package:school_admin/admin_features/time_table/weekly_sessions_list_model.dart';
import 'package:school_admin/admin_features/time_table/weekly_timetable_model.dart';
import 'package:school_admin/admin_features/time_table/weekly_timetables_list_model.dart';
import 'package:school_admin/common/network/educonnect_network_helper.dart';

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
      final result = EduconnectNetworkHelper.getTableQueryData(model);
      print('${model.runtimeType}: $result');
    }
  });
}
