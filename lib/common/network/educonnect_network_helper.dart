import 'package:supabase_flutter/supabase_flutter.dart';

import '../../admin_features/list_models.dart';
import '../../admin_features/models.dart';
import 'educonnect_tables.dart';

class SupabaseCridentials {
  static const String supabaseUrl = 'https://rqxinbwhqmugrjffbpjw.supabase.co';
  static const String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJxeGluYndocW11Z3JqZmZicGp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY4ODI4NDUsImV4cCI6MjAyMjQ1ODg0NX0.AwIDwWWJicgFl_b6CTlf6kE5jVPNkhhPO9wSRxSK5yA';
  static final SupabaseClient supabase = Supabase.instance.client;
  static final GoTrueClient authInstance = SupabaseCridentials.supabase.auth;
}

class EduconnectNetworkHelper {
  // user_role: id | name

  static DatabaseTable getTableQueryData(dynamic model) {
    if (model is StudentModel || model is StudentsListModel) {
      return EduconnectTables.student;
    }
    if (model is AdminModel || model is AdminsListModel) {
      return EduconnectTables.admin;
    } else if (model is InstructorModel || model is InstructorsListModel) {
      return EduconnectTables.instructor;
    } else if (model is GradeModel || model is GradesListModel) {
      return EduconnectTables.grade;
    } else if (model is ClassModel || model is ClassesListModel) {
      return EduconnectTables.classTable;
    } else if (model is SubjectModel || model is SubjectsListModel) {
      return EduconnectTables.subject;
    } else if (model is WeeklySessionModel ||
        model is WeeklySessionsListModel) {
      return EduconnectTables.weeklySessions;
    } else if (model is WeeklyTimetableModel ||
        model is WeeklyTimetablesListModel) {
      return EduconnectTables.weeklyTimetable;
    } else if (model is ExamTypeModel || model is ExamTypesListModel) {
      return EduconnectTables.examType;
    } else if (model is ExamModel || model is ExamsListModel) {
      return EduconnectTables.exam;
    } else if (model is ExamSessionModel || model is ExamSessionsListModel) {
      return EduconnectTables.examSession;
    } else if (model is ExamTimetableModel ||
        model is ExamTimetablesListModel) {
      return EduconnectTables.examTimetable;
    } else if (model is HomeworkModel || model is HomeworksListModel) {
      return EduconnectTables.homework;
    } else if (model is NewsModel || model is NewsListModel) {
      return EduconnectTables.news;
    }
    return DatabaseTable.empty();
  }
}
