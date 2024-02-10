import 'package:supabase_flutter/supabase_flutter.dart';

import '../../admin_features/classes/data/models/class_model.dart';
import '../../admin_features/classes/data/models/classes_list_model.dart';
import '../../admin_features/dashboard/data/models/all_models.dart';
import '../../admin_features/grades/data/models/grade_model.dart';
import '../../admin_features/grades/data/models/grades_list_model.dart';
import '../../admin_features/users/admins/data/models/admin_model.dart';
import '../../admin_features/users/admins/data/models/admins_list_model.dart';
import '../../admin_features/users/instructor/data/models/instructor_model.dart';
import '../../admin_features/users/instructor/data/models/instructors_list_model.dart';
import '../../admin_features/users/students/data/models/student_model.dart';
import '../../admin_features/users/students/data/models/students_list_model.dart';

class SupabaseCridentials {
  static const String supabaseUrl = 'https://rqxinbwhqmugrjffbpjw.supabase.co';
  static const String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJxeGluYndocW11Z3JqZmZicGp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY4ODI4NDUsImV4cCI6MjAyMjQ1ODg0NX0.AwIDwWWJicgFl_b6CTlf6kE5jVPNkhhPO9wSRxSK5yA';
  static final SupabaseClient supabase = Supabase.instance.client;
  static final GoTrueClient authInstance = SupabaseCridentials.supabase.auth;
}

class EduconnectNetworkHelper {
// user_role: id | name
  static const ({String tableName, String selectQuery}) userRole = (
    tableName: 'user_role',
    selectQuery: '*',
  );

// admin_role: id | name
  static const ({String tableName, String selectQuery}) adminRole = (
    tableName: 'admin_role',
    selectQuery: '*',
  );

// school_user: id | name | phone_number | address | gender | email | profile_picture | user_role_id
  static const ({String tableName, String selectQuery}) schoolUser = (
    tableName: 'school_user',
    selectQuery: '*',
  );

// admin: school_user_id | specialization(optional) | hire_date | admin_role_id
  static const ({String tableName, String selectQuery}) admin = (
    tableName: 'admin',
    selectQuery: '*,admin_role(*)',
  );

// instructor: school_user_id | date_of_birth | specialization(optional) | hire_date
  static const ({String tableName, String selectQuery}) instructor = (
    tableName: 'instructor',
    selectQuery: '*',
  );

// grade: id | name
  static const ({String tableName, String selectQuery}) grade = (
    tableName: 'grade',
    selectQuery: '*',
  );

// class: id | name | grade_id
  static const ({String tableName, String selectQuery}) classTable = (
    tableName: 'class',
    selectQuery: '*,grade(*)',
  );

// subject: id | name | total_marks | grade_id
  static const ({String tableName, String selectQuery}) subject = (
    tableName: 'subject',
    selectQuery: '*,grade(*)',
  );

// student: school_user_id | guardians_phone_number | payment_status | class_id
  static const ({String tableName, String selectQuery}) student = (
    tableName: 'student',
    // selectQuery: ['class', 'grade'],
    selectQuery: '*,class(*,grade(*)))',
  );

// instructor_assignment: id | name | instructor_id | subject_id | class_id |
  static const ({String tableName, String selectQuery}) instructorAssignment = (
    tableName: 'instructor_assignment',
    // selectQuery: ['instructor', 'subject', 'class'],
    selectQuery: '*,instructor(*),class(*,grade(*)),subject(*,grade(*)))',
  );

// weekly_timetable: id | name | term | class_id |
  static const ({String tableName, String selectQuery}) weeklyTimetable = (
    tableName: 'weekly_timetable',
    selectQuery: '*,class(*,grade(*))',
  );

// weekly_sessions: id | name | session_number | weekday | start_time | end_time | session_interval | instructor_assignment_id | weekly_timetable_id
  static const ({String tableName, String selectQuery}) weeklySessions = (
    tableName: 'weekly_sessions',
    // selectQuery: ['instructor_assignment', 'weekly_timetable'],
    selectQuery:
        '*,instructor_assignment(*,instructor(*),class(*,grade(*)),subject(*,grade(*)))),weekly_timetable(*,class(*,grade(*)))',
  );

// exam_type: id | name | marks_percent
  static const examType = (
    tableName: 'exam_type',
    selectQuery: '*',
  );

// exam: id | name | date_time | subject_id | exam_type_id
  static const ({String tableName, String selectQuery}) exam = (
    tableName: 'exam',
    // selectQuery: ['subject', 'exam_type'],

    selectQuery: '*,subject(*,grade(*)),exam_type(*)',
  );

// exam_timetable: id | name | term | grade_id | exam_id
  static const ({String tableName, String selectQuery}) examTimetable = (
    tableName: 'exam_timetable',
    // selectQuery: ['grade', 'exam'],
    selectQuery: '*,exam(*,subject(*,grade(*)),exam_type(*))',
  );

// exam_session: id | name | session_number | weekday | start_time | end_time | session_interval | instructor_id | exam_timetable_id
  static const ({String tableName, String selectQuery}) examSession = (
    tableName: 'exam_session',
    // selectQuery: ['instructor', 'exam_timetable'],
    selectQuery:
        '*,exam_session(*),*,exam_timetable(*,exam(*,subject(*,grade(*)),exam_type(*)))',
  );

// homework: id | name | date | content | instructor_assignment_id
  static const ({String tableName, String selectQuery}) homework = (
    tableName: 'homework',
    // selectQuery: ['instructor_assignment'],
    selectQuery: '*,exam_session()',
  );

// news: id | name | thumbnail | date_time | description
  static const news = (
    tableName: 'news',
    selectQuery: '*',
  );

  static ({String? tableName, String? selectQuery}) getTableQueryData(
      dynamic model) {
    if (model is StudentModel || model is StudentsListModel) {
      return student;
    }
    if (model is AdminModel || model is AdminsListModel) {
      return admin;
    } else if (model is InstructorModel || model is InstructorsListModel) {
      return instructor;
    } else if (model is GradeModel || model is GradesListModel) {
      return grade;
    } else if (model is ClassModel || model is ClassesListModel) {
      return classTable;
    } else if (model is SubjectModel || model is SubjectsListModel) {
      return (subject);
    } else if (model is WeeklySessionModel ||
        model is WeeklySessionsListModel) {
      return (weeklySessions);
    } else if (model is WeeklyTimetableModel ||
        model is WeeklyTimetablesListModel) {
      return (weeklyTimetable);
    } else if (model is ExamTypeModel || model is ExamTypesListModel) {
      return (examType);
    } else if (model is ExamModel || model is ExamsListModel) {
      return (exam);
    } else if (model is ExamSessionModel || model is ExamSessionsListModel) {
      return (examSession);
    } else if (model is ExamTimetableModel ||
        model is ExamTimetablesListModel) {
      return (examTimetable);
    } else if (model is HomeworkModel || model is HomeworksListModel) {
      return (homework);
    } else if (model is NewsModel || model is NewsListModel) {
      return (news);
    }
    return (
      tableName: null,
      selectQuery: null,
    );
  }
}
