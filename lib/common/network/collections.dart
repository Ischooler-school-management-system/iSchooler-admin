import 'package:cloud_firestore/cloud_firestore.dart';

import '../../admin_features/dashboard/data/models/all_models.dart';
import '../../admin_features/users/admins/data/models/admin_model.dart';
import '../../admin_features/users/admins/data/models/all_admins_model.dart';
import '../../admin_features/users/all_users_model.dart';
import '../../admin_features/users/students/data/models/all_students_model.dart';
import '../../admin_features/users/students/data/models/student_model.dart';
import '../../admin_features/users/user_model.dart';

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
    if (userModel is StudentModel || userModel is AllStudentsModel) {
      return students;
    }
    if (userModel is AdminModel || userModel is AllAdminsModel) {
      return admins;
    } else if (userModel is InstructorModel ||
        userModel is AllInstructorModel) {
      return instructors;
    }
    return null;
  }

  static String? getCollectionByModel(dynamic model) {
    if (model is UserModel || model is AllUsersModel) {
      return _getUserCollectionName(model);
    } else if (model is GradeModel || model is AllGradeModel) {
      return grades;
    } else if (model is ClassModel || model is AllClassModel) {
      return classes;
    } else if (model is SubjectModel || model is AllSubjectModel) {
      return subjects;
    } else if (model is WeeklySessionModel || model is AllWeeklySessionModel) {
      return weeklySessions;
    } else if (model is WeeklyTimetableModel ||
        model is AllWeeklyTimetableModel) {
      return weeklyTimetables;
    } else if (model is ExamTypeModel || model is AllExamTypeModel) {
      return examTypes;
    } else if (model is ExamModel || model is AllExamModel) {
      return exams;
    } else if (model is ExamSessionModel || model is AllExamSessionModel) {
      return examSessions;
    } else if (model is ExamTimetableModel || model is AllExamTimetableModel) {
      return examTimetables;
    } else if (model is HomeworkModel || model is AllHomeworkModel) {
      return homework;
    } else if (model is NewsModel || model is AllNewsModel) {
      return news;
    }
    return null;
  }
}
