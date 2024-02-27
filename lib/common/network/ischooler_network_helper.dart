import 'package:ischooler_admin/admin_features/homework/data/models/homework_model.dart';
import 'package:ischooler_admin/admin_features/homework/data/models/homeworks_list_model.dart';

import '../../admin_features/calender/weekday/data/models/weekday_model.dart';
import '../../admin_features/calender/weekly_session/data/models/weekly_session_model.dart';
import '../../admin_features/calender/weekly_session/data/models/weekly_sessions_list_model.dart';
import '../../admin_features/calender/weekly_timetable/data/models/weekly_timetable_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../admin_features/list_models.dart';
import '../../admin_features/models.dart';
import 'ischooler_tables.dart';

class SupabaseCredentials {
  static const String supabaseUrl = 'https://rqxinbwhqmugrjffbpjw.supabase.co';
  static const String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJxeGluYndocW11Z3JqZmZicGp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY4ODI4NDUsImV4cCI6MjAyMjQ1ODg0NX0.AwIDwWWJicgFl_b6CTlf6kE5jVPNkhhPO9wSRxSK5yA';
  static final SupabaseClient supabase = Supabase.instance.client;
  static final GoTrueClient authInstance = SupabaseCredentials.supabase.auth;
}

class IschoolerNetworkHelper {
  // user_role: id | name

  static DatabaseTable getTableQueryData(dynamic model) {
    if (model is StudentModel || model is StudentsListModel) {
      return IschoolerTables.student;
    } else if (model is AdminModel || model is AdminsListModel) {
      return IschoolerTables.admin;
    } else if (model is AdminRoleModel || model is AdminRolesListModel) {
      return IschoolerTables.adminRole;
    } else if (model is InstructorModel || model is InstructorsListModel) {
      return IschoolerTables.instructor;
    } else if (model is InstructorAssignmentModel ||
        model is InstructorAssignmentsListModel) {
      return IschoolerTables.instructorAssignment;
    } else if (model is GradeModel || model is GradesListModel) {
      return IschoolerTables.grade;
    } else if (model is ClassModel || model is ClassesListModel) {
      return IschoolerTables.classTable;
    } else if (model is SubjectModel || model is SubjectsListModel) {
      return IschoolerTables.subject;
    } else if (model is WeeklySessionModel ||
        model is WeeklySessionsListModel) {
      return IschoolerTables.weeklySessions;
    } else if (model is WeeklyTimetableModel ||
        model is WeeklyTimetablesListModel) {
      return IschoolerTables.weeklyTimetable;
    } else if (model is WeekdaysListModel || model is WeekdayModel) {
      return IschoolerTables.weekday;
    } else if (model is ExamTypeModel || model is ExamTypesListModel) {
      return IschoolerTables.examType;
    } else if (model is ExamModel || model is ExamsListModel) {
      return IschoolerTables.exam;
    } else if (model is ExamSessionModel || model is ExamSessionsListModel) {
      return IschoolerTables.examSession;
    } else if (model is ExamTimetableModel ||
        model is ExamTimetablesListModel) {
      return IschoolerTables.examTimetable;
    } else if (model is HomeworkModel || model is HomeworksListModel) {
      return IschoolerTables.homework;
    } else if (model is NewsModel || model is NewsListModel) {
      return IschoolerTables.news;
    }
    return DatabaseTable.empty();
  }
}
// tost
