import 'package:cloud_firestore/cloud_firestore.dart';
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
import '../madpoly.dart';

class SupabaseCridentials {
  static const String supabaseUrl = 'https://rqxinbwhqmugrjffbpjw.supabase.co';
  static const String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJxeGluYndocW11Z3JqZmZicGp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY4ODI4NDUsImV4cCI6MjAyMjQ1ODg0NX0.AwIDwWWJicgFl_b6CTlf6kE5jVPNkhhPO9wSRxSK5yA';
  static final SupabaseClient supabase = Supabase.instance.client;
  static final GoTrueClient authInstance = SupabaseCridentials.supabase.auth;
}

class EduconnectNetworkHelper {
  static final FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;

  static final userRole = (
    tableName: 'user_role',
    relatedTables: [],
  );
  static final adminRole = (
    tableName: 'admin_role',
    relatedTables: [],
  );
  static const schoolUser = (
    tableName: 'school_user',
    relatedTables: ['user_role'],
  );
  static const admin = (
    tableName: 'admin',
    relatedTables: ['admin_role'],
  );
  static final instructor = (
    tableName: 'instructor',
    relatedTables: [],
  );
  static final grade = (
    tableName: 'grade',
    relatedTables: [],
  );
  static const classTable = (
    tableName: 'class',
    relatedTables: ['grade'],
  );
  static const subject = (
    tableName: 'subject',
    relatedTables: ['grade'],
  );
  static final student = (
    tableName: 'student',
    relatedTables: ['class', ...(classTable.relatedTables)],
  );
  static const instructorAssignment = (
    tableName: 'instructor_assignment',
    relatedTables: ['instructor', 'subject', 'class,']
  );
  static const weeklyTimetable = (
    tableName: 'weekly_timetable',
    relatedTables: ['class', 'grade'],
  );
  static const weeklySessions = (
    tableName: 'weekly_sessions',
    relatedTables: ['instructor_assignment', 'weekly_timetable,']
  );
  static final examType = (
    tableName: 'exam_type',
    relatedTables: [],
  );
  static const exam = (
    tableName: 'exam',
    relatedTables: ['subject', 'exam_type'],
  );
  static const examTimetable = (
    tableName: 'exam_timetable',
    relatedTables: ['grade', 'exam'],
  );
  static const examSession = (
    tableName: 'exam_session',
    relatedTables: ['instructor', 'exam_timetable,']
  );
  static const homework = (
    tableName: 'homework',
    relatedTables: ['instructor_assignment'],
  );
  static final news = (
    tableName: 'news',
    relatedTables: [],
  );
  // '*, class(*, grade(*))';
  static String selectQueryMaker(List<dynamic> strings) {
    if (strings.isEmpty) {
      return '*';
    }

    String result = '*,${strings.first}(*';
    if (strings.length > 1) {
      result += ',';
    }
    for (int i = 1; i < strings.length; i++) {
      result += '${strings[i]}(*';
      if (i != strings.length - 1) {
        result += ',';
      }
    }
    result += ')' * (strings.length);

    return result;
  }

  static ({
    String? tableName,
    String? selectQuery,
  }) getTableQueryData(dynamic model) {
    ({String? tableName, String? selectQuery}) tableQueryData = (
      tableName: '',
      selectQuery: '',
    );

    if (model is StudentModel || model is StudentsListModel) {
      return (
        tableName: student.tableName,
        selectQuery: '${selectQueryMaker(student.relatedTables)},school_user(*)'
      );
    }
    if (model is AdminModel || model is AdminsListModel) {
      return (
        tableName: admin.tableName,
        selectQuery: '${selectQueryMaker(admin.relatedTables)},school_user(*)'
      );
    } else if (model is InstructorModel || model is InstructorsListModel) {
      return (
        tableName: instructor.tableName,
        selectQuery:
            '${selectQueryMaker(instructor.relatedTables)},school_user(*)'
      );
    } else if (model is GradeModel || model is GradesListModel) {
      tableQueryData = (
        tableName: grade.tableName,
        selectQuery: selectQueryMaker(grade.relatedTables),
      );
    } else if (model is ClassModel || model is ClassesListModel) {
      tableQueryData = (
        tableName: classTable.tableName,
        selectQuery: selectQueryMaker(classTable.relatedTables),
      );
    } else if (model is SubjectModel || model is SubjectsListModel) {
      tableQueryData = (
        tableName: subject.tableName,
        selectQuery: selectQueryMaker(subject.relatedTables),
      );
    } else if (model is WeeklySessionModel ||
        model is WeeklySessionsListModel) {
      tableQueryData = (
        tableName: weeklySessions.tableName,
        selectQuery: selectQueryMaker(weeklySessions.relatedTables),
      );
    } else if (model is WeeklyTimetableModel ||
        model is WeeklyTimetablesListModel) {
      tableQueryData = (
        tableName: weeklyTimetable.tableName,
        selectQuery: selectQueryMaker(weeklyTimetable.relatedTables),
      );
    } else if (model is ExamTypeModel || model is ExamTypesListModel) {
      tableQueryData = (
        tableName: examType.tableName,
        selectQuery: selectQueryMaker(examType.relatedTables),
      );
    } else if (model is ExamModel || model is ExamsListModel) {
      tableQueryData = (
        tableName: exam.tableName,
        selectQuery: selectQueryMaker(exam.relatedTables),
      );
    } else if (model is ExamSessionModel || model is ExamSessionsListModel) {
      tableQueryData = (
        tableName: examSession.tableName,
        selectQuery: selectQueryMaker(examSession.relatedTables),
      );
    } else if (model is ExamTimetableModel ||
        model is ExamTimetablesListModel) {
      tableQueryData = (
        tableName: examTimetable.tableName,
        selectQuery: selectQueryMaker(examTimetable.relatedTables),
      );
    } else if (model is HomeworkModel || model is HomeworksListModel) {
      tableQueryData = (
        tableName: homework.tableName,
        selectQuery: selectQueryMaker(homework.relatedTables),
      );
    } else if (model is NewsModel || model is NewsListModel) {
      tableQueryData = (
        tableName: news.tableName,
        selectQuery: selectQueryMaker(news.relatedTables),
      );
    }
    Madpoly.print(
      'collection name = $tableQueryData',
      tag: 'educonnect_network_helper > ',
      developer: "Ziad",
    );
    return tableQueryData;
  }
}
