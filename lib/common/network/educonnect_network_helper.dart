import 'package:cloud_firestore/cloud_firestore.dart';

import '../../admin_features/classes/data/models/classes_list_model.dart';
import '../../admin_features/classes/data/models/class_model.dart';
import '../../admin_features/dashboard/data/models/all_models.dart';
import '../../admin_features/grades/data/models/grade_model.dart';
import '../../admin_features/grades/data/models/grades_list_model.dart';
import '../../admin_features/users/admins/data/models/admin_model.dart';
import '../../admin_features/users/admins/data/models/admins_list_model.dart';
import '../../admin_features/users/users_list_model.dart';
import '../../admin_features/users/instructor/data/models/instructors_list_model.dart';
import '../../admin_features/users/instructor/data/models/instructor_model.dart';
import '../../admin_features/users/students/data/models/students_list_model.dart';
import '../../admin_features/users/students/data/models/student_model.dart';
import '../../admin_features/users/user_model.dart';
import '../madpoly.dart';

class EduconnectNetworkHelper {
  static final FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
  static const users = 'users';
  static const students = 'students';
  static const admins = 'admins';

  static const instructors = 'instructors';

  static const grades = 'grades';
  static const classes = 'classes';
  static const subjects = 'subjects';
  static const weeklySessions = 'weekly_sessions';
  static const weeklyTimetables = 'weekly_timetables';
  static const examTypes = 'exam_types';
  static const exams = 'exams';
  static const examSessions = 'exam_sessions';
  static const examTimetables = 'exam_timetables';
  static const homework = 'homework';
  static const news = 'news';

  static String? _getUserCollectionName(dynamic userModel) {
    if (userModel is StudentModel || userModel is StudentsListModel) {
      return students;
    }
    if (userModel is AdminModel || userModel is AdminsListModel) {
      return admins;
    } else if (userModel is InstructorModel ||
        userModel is InstructorsListModel) {
      return instructors;
    }
    return null;
  }

  static String? getCollectionByModel(dynamic model) {
    String? collectionName;

    if (model is UserModel || model is UsersListModel) {
      collectionName = _getUserCollectionName(model);
    } else if (model is GradeModel || model is GradesListModel) {
      collectionName = grades;
    } else if (model is ClassModel || model is ClassesListModel) {
      collectionName = classes;
    } else if (model is SubjectModel || model is SubjectsListModel) {
      collectionName = subjects;
    } else if (model is WeeklySessionModel ||
        model is WeeklySessionsListModel) {
      collectionName = weeklySessions;
    } else if (model is WeeklyTimetableModel ||
        model is WeeklyTimetablesListModel) {
      collectionName = weeklyTimetables;
    } else if (model is ExamTypeModel || model is ExamTypesListModel) {
      collectionName = examTypes;
    } else if (model is ExamModel || model is ExamsListModel) {
      collectionName = exams;
    } else if (model is ExamSessionModel || model is ExamSessionsListModel) {
      collectionName = examSessions;
    } else if (model is ExamTimetableModel ||
        model is ExamTimetablesListModel) {
      collectionName = examTimetables;
    } else if (model is HomeworkModel || model is HomeworksListModel) {
      collectionName = homework;
    } else if (model is NewsModel || model is NewsListModel) {
      collectionName = news;
    }
    Madpoly.print(
      'collection name = $collectionName',
      tag: 'educonnect_network_helper > ',
      developer: "Ziad",
    );
    return collectionName;
  }
}
