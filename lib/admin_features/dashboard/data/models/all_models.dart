import '../../../users/user_model.dart';
import '../../../../common/educonnect_model.dart';

/*
class GradeModel
class ClassModel
class SubjectModel
class WeeklySessionModel
class WeeklyTimetableModel
class ExamTypeModel
class ExamModel
class ExamSessionModel
class ExamTimetableModel
class InstructorModel
class HomeworkModel
class NewsModel 

AllGradeModel
AllClassModel
AllSubjectModel
AllWeeklySessionModel
AllWeeklyTimetableModel
AllExamTypeModel
AllExamModel
AllExamSessionModel
AllExamTimetableModel
AllInstructorModel
AllHomeworkModel
AllNewsModel

class GradeModel
class AllGradeModel

class ClassModel
class AllClassModel

class SubjectModel
class AllSubjectModel

class WeeklySessionModel
class AllWeeklySessionModel

class WeeklyTimetableModel
class AllWeeklyTimetableModel

class ExamTypeModel
class AllExamTypeModel

class ExamModel
class AllExamModel

class ExamSessionModel
class AllExamSessionModel

class ExamTimetableModel
class AllExamTimetableModel

class InstructorModel
class AllInstructorModel

class HomeworkModel
class AllHomeworkModel

class NewsModel
class AllNewsModel



*/
class GradeModel extends EduconnectModel {
  final String gradeId;
  final String name;

  const GradeModel({
    required super.id,
    required this.gradeId,
    required this.name,
  });

  @override
  List<Object?> get props => [id, gradeId, name];

  factory GradeModel.empty() {
    return const GradeModel(id: '-1', gradeId: '', name: '');
  }

  factory GradeModel.fromMap(Map<String, dynamic> map) {
    return GradeModel(
      id: map['id'] ?? '',
      gradeId: map['gradeId'] ?? '',
      name: map['name'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'gradeId': gradeId,
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Grade ID': gradeId,
      'Name': name,
    };
  }

  @override
  GradeModel copyWith({String? id, String? gradeId, String? name}) {
    return GradeModel(
      id: id ?? this.id,
      gradeId: gradeId ?? this.gradeId,
      name: name ?? this.name,
    );
  }
}

class ClassModel extends EduconnectModel {
  final String classId;
  final String className;
  final GradeModel grade; // Injecting GradeModel object

  const ClassModel({
    required super.id,
    required this.classId,
    required this.className,
    required this.grade,
  });

  @override
  List<Object?> get props => [id, classId, className, grade];

  factory ClassModel.empty() {
    return ClassModel(
        id: '-1', classId: '', className: '', grade: GradeModel.empty());
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      id: map['id'] ?? '',
      classId: map['classId'] ?? '',
      className: map['className'] ?? '',
      grade: GradeModel.fromMap(map['grade'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'classId': classId,
      'className': className,
      'grade': grade.toMap(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Class ID': classId,
      'Class Name': className,
      'Grade': grade.toDisplayMap(),
    };
  }

  @override
  ClassModel copyWith(
      {String? id, String? classId, String? className, GradeModel? grade}) {
    return ClassModel(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      className: className ?? this.className,
      grade: grade ?? this.grade,
    );
  }
}

class SubjectModel extends EduconnectModel {
  final String subjectId;
  final String name;
  final GradeModel grade; // Injecting GradeModel object
  final int totalMarks;

  const SubjectModel({
    required super.id,
    required this.subjectId,
    required this.name,
    required this.grade,
    required this.totalMarks,
  });

  @override
  List<Object?> get props => [id, subjectId, name, grade, totalMarks];

  factory SubjectModel.empty() {
    return SubjectModel(
        id: '-1',
        subjectId: '',
        name: '',
        grade: GradeModel.empty(),
        totalMarks: 0);
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'] ?? '',
      subjectId: map['subjectId'] ?? '',
      name: map['name'] ?? '',
      grade: GradeModel.fromMap(map['grade'] ?? {}),
      totalMarks: map['totalMarks'] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'subjectId': subjectId,
      'name': name,
      'grade': grade.toMap(),
      'totalMarks': totalMarks,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Subject ID': subjectId,
      'Name': name,
      'Grade': grade.toDisplayMap(),
      'Total Marks': totalMarks,
    };
  }

  @override
  SubjectModel copyWith(
      {String? id,
      String? subjectId,
      String? name,
      GradeModel? grade,
      int? totalMarks}) {
    return SubjectModel(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      totalMarks: totalMarks ?? this.totalMarks,
    );
  }
}

class WeeklySessionModel extends EduconnectModel {
  final String sessionId;
  final int sessionNumber;
  final String weekday;
  final DateTime startTime;
  final DateTime endTime;
  final int sessionInterval;
  final SubjectModel subject;
  final String? instructor; // Optional

  const WeeklySessionModel({
    required super.id,
    required this.sessionId,
    required this.sessionNumber,
    required this.weekday,
    required this.startTime,
    required this.endTime,
    required this.sessionInterval,
    required this.subject,
    this.instructor,
  });

  @override
  List<Object?> get props => [
        id,
        sessionId,
        sessionNumber,
        weekday,
        startTime,
        endTime,
        sessionInterval,
        subject,
        instructor
      ];

  factory WeeklySessionModel.empty() {
    return WeeklySessionModel(
      id: '-1',
      sessionId: '',
      sessionNumber: 0,
      weekday: '',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      sessionInterval: 0,
      subject: SubjectModel.empty(),
      instructor: null,
    );
  }

  factory WeeklySessionModel.fromMap(Map<String, dynamic> map) {
    return WeeklySessionModel(
      id: map['id'] ?? '',
      sessionId: map['sessionId'] ?? '',
      sessionNumber: map['sessionNumber'] ?? 0,
      weekday: map['weekday'] ?? '',
      startTime: DateTime.parse(map['startTime'] ?? ''),
      endTime: DateTime.parse(map['endTime'] ?? ''),
      sessionInterval: map['sessionInterval'] ?? 0,
      subject: SubjectModel.fromMap(map['subject'] ?? {}),
      instructor: map['instructor'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'sessionId': sessionId,
      'sessionNumber': sessionNumber,
      'weekday': weekday,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'sessionInterval': sessionInterval,
      'subject': subject.toMap(),
      'instructor': instructor,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Session ID': sessionId,
      'Session Number': sessionNumber,
      'Weekday': weekday,
      'Start Time': startTime.toString(),
      'End Time': endTime.toString(),
      'Session Interval': sessionInterval,
      'Subject': subject.toDisplayMap(),
      'Instructor': instructor ?? 'N/A',
    };
  }

  @override
  WeeklySessionModel copyWith({
    String? id,
    String? sessionId,
    int? sessionNumber,
    String? weekday,
    DateTime? startTime,
    DateTime? endTime,
    int? sessionInterval,
    SubjectModel? subject,
    String? instructor,
  }) {
    return WeeklySessionModel(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      weekday: weekday ?? this.weekday,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      sessionInterval: sessionInterval ?? this.sessionInterval,
      subject: subject ?? this.subject,
      instructor: instructor ?? this.instructor,
    );
  }
}

class WeeklyTimetableModel extends EduconnectModel {
  final String timetableId;
  final ClassModel classInfo;
  final String term;
  final List<WeeklySessionModel> weeklySessions;
  final GradeModel grade;

  const WeeklyTimetableModel({
    required super.id,
    required this.timetableId,
    required this.classInfo,
    required this.term,
    required this.weeklySessions,
    required this.grade,
  });

  @override
  List<Object?> get props =>
      [id, timetableId, classInfo, term, weeklySessions, grade];

  factory WeeklyTimetableModel.empty() {
    return WeeklyTimetableModel(
      id: '-1',
      timetableId: '',
      classInfo: ClassModel.empty(),
      term: '',
      weeklySessions: const [],
      grade: GradeModel.empty(),
    );
  }

  factory WeeklyTimetableModel.fromMap(Map<String, dynamic> map) {
    return WeeklyTimetableModel(
      id: map['id'] ?? '',
      timetableId: map['timetableId'] ?? '',
      classInfo: ClassModel.fromMap(map['classInfo'] ?? {}),
      term: map['term'] ?? '',
      weeklySessions: (map['weeklySessions'] as List<dynamic>?)
              ?.map((sessionMap) => WeeklySessionModel.fromMap(sessionMap))
              .toList() ??
          [],
      grade: GradeModel.fromMap(map['grade'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'timetableId': timetableId,
      'classInfo': classInfo.toMap(),
      'term': term,
      'weeklySessions':
          weeklySessions.map((session) => session.toMap()).toList(),
      'grade': grade.toMap(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Timetable ID': timetableId,
      'Class Info': classInfo.toDisplayMap(),
      'Term': term,
      'Weekly Sessions':
          weeklySessions.map((session) => session.toDisplayMap()).toList(),
      'Grade': grade.toDisplayMap(),
    };
  }

  @override
  WeeklyTimetableModel copyWith({
    String? id,
    String? timetableId,
    ClassModel? classInfo,
    String? term,
    List<WeeklySessionModel>? weeklySessions,
    GradeModel? grade,
  }) {
    return WeeklyTimetableModel(
      id: id ?? this.id,
      timetableId: timetableId ?? this.timetableId,
      classInfo: classInfo ?? this.classInfo,
      term: term ?? this.term,
      weeklySessions: weeklySessions ?? this.weeklySessions,
      grade: grade ?? this.grade,
    );
  }
}

class ExamTypeModel extends EduconnectModel {
  final String examTypeId;
  final String name;
  final double marksPercent;

  const ExamTypeModel({
    required super.id,
    required this.examTypeId,
    required this.name,
    required this.marksPercent,
  });

  @override
  List<Object?> get props => [id, examTypeId, name, marksPercent];

  factory ExamTypeModel.empty() {
    return const ExamTypeModel(
        id: '-1', examTypeId: '', name: '', marksPercent: 0.0);
  }

  factory ExamTypeModel.fromMap(Map<String, dynamic> map) {
    return ExamTypeModel(
      id: map['id'] ?? '',
      examTypeId: map['examTypeId'] ?? '',
      name: map['name'] ?? '',
      marksPercent: map['marksPercent'] ?? 0.0,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'examTypeId': examTypeId,
      'name': name,
      'marksPercent': marksPercent,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Exam Type ID': examTypeId,
      'Name': name,
      'Marks Percent': marksPercent,
    };
  }

  @override
  ExamTypeModel copyWith(
      {String? id, String? examTypeId, String? name, double? marksPercent}) {
    return ExamTypeModel(
      id: id ?? this.id,
      examTypeId: examTypeId ?? this.examTypeId,
      name: name ?? this.name,
      marksPercent: marksPercent ?? this.marksPercent,
    );
  }
}

class ExamModel extends EduconnectModel {
  final String examId;
  final SubjectModel subject;
  final DateTime date;
  final DateTime time;
  final ExamTypeModel examType;

  const ExamModel({
    required super.id,
    required this.examId,
    required this.subject,
    required this.date,
    required this.time,
    required this.examType,
  });

  @override
  List<Object?> get props => [id, examId, subject, date, time, examType];

  factory ExamModel.empty() {
    return ExamModel(
        id: '-1',
        examId: '',
        subject: SubjectModel.empty(),
        date: DateTime.now(),
        time: DateTime.now(),
        examType: ExamTypeModel.empty());
  }

  factory ExamModel.fromMap(Map<String, dynamic> map) {
    return ExamModel(
      id: map['id'] ?? '',
      examId: map['examId'] ?? '',
      subject: SubjectModel.fromMap(map['subject'] ?? {}),
      date: DateTime.parse(map['date'] ?? ''),
      time: DateTime.parse(map['time'] ?? ''),
      examType: ExamTypeModel.fromMap(map['examType'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'examId': examId,
      'subject': subject.toMap(),
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'examType': examType.toMap(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Exam ID': examId,
      'Subject': subject.toDisplayMap(),
      'Date': date.toString(),
      'Time': time.toString(),
      'Exam Type': examType.toDisplayMap(),
    };
  }

  @override
  ExamModel copyWith(
      {String? id,
      String? examId,
      SubjectModel? subject,
      DateTime? date,
      DateTime? time,
      ExamTypeModel? examType}) {
    return ExamModel(
      id: id ?? this.id,
      examId: examId ?? this.examId,
      subject: subject ?? this.subject,
      date: date ?? this.date,
      time: time ?? this.time,
      examType: examType ?? this.examType,
    );
  }
}

class ExamSessionModel extends EduconnectModel {
  final String sessionId;
  final int sessionNumber;
  final String weekday;
  final DateTime startTime;
  final DateTime endTime;
  final SubjectModel subject;
  final int sessionInterval;
  final List<InstructorModel> instructors; // Optional

  const ExamSessionModel({
    required super.id,
    required this.sessionId,
    required this.sessionNumber,
    required this.weekday,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.sessionInterval,
    this.instructors = const [],
  });

  @override
  List<Object?> get props => [
        id,
        sessionId,
        sessionNumber,
        weekday,
        startTime,
        endTime,
        subject,
        sessionInterval,
        instructors
      ];

  factory ExamSessionModel.empty() {
    return ExamSessionModel(
      id: '-1',
      sessionId: '',
      sessionNumber: 0,
      weekday: '',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      subject: SubjectModel.empty(),
      sessionInterval: 0,
      instructors: const [],
    );
  }

  factory ExamSessionModel.fromMap(Map<String, dynamic> map) {
    return ExamSessionModel(
      id: map['id'] ?? '',
      sessionId: map['sessionId'] ?? '',
      sessionNumber: map['sessionNumber'] ?? 0,
      weekday: map['weekday'] ?? '',
      startTime: DateTime.parse(map['startTime'] ?? ''),
      endTime: DateTime.parse(map['endTime'] ?? ''),
      subject: SubjectModel.fromMap(map['subject'] ?? {}),
      sessionInterval: map['sessionInterval'] ?? 0,
      instructors: (map['instructors'] as List<dynamic>?)
              ?.map((instructorMap) => InstructorModel.fromMap(instructorMap))
              .toList() ??
          [],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'sessionId': sessionId,
      'sessionNumber': sessionNumber,
      'weekday': weekday,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'subject': subject.toMap(),
      'sessionInterval': sessionInterval,
      'instructors':
          instructors.map((instructor) => instructor.toMap()).toList(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Session ID': sessionId,
      'Session Number': sessionNumber,
      'Weekday': weekday,
      'Start Time': startTime.toString(),
      'End Time': endTime.toString(),
      'Subject': subject.toDisplayMap(),
      'Session Interval': sessionInterval,
      'Instructors':
          instructors.map((instructor) => instructor.toDisplayMap()).toList(),
    };
  }

  @override
  ExamSessionModel copyWith({
    String? id,
    String? sessionId,
    int? sessionNumber,
    String? weekday,
    DateTime? startTime,
    DateTime? endTime,
    SubjectModel? subject,
    int? sessionInterval,
    List<InstructorModel>? instructors,
  }) {
    return ExamSessionModel(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      weekday: weekday ?? this.weekday,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      subject: subject ?? this.subject,
      sessionInterval: sessionInterval ?? this.sessionInterval,
      instructors: instructors ?? this.instructors,
    );
  }
}

class ExamTimetableModel extends EduconnectModel {
  final String timetableId;
  final String term;
  final List<ExamSessionModel> examSessions;
  final String gradeId;
  final ExamTypeModel examType;

  const ExamTimetableModel({
    required super.id,
    required this.timetableId,
    required this.term,
    required this.examSessions,
    required this.gradeId,
    required this.examType,
  });

  @override
  List<Object?> get props =>
      [id, timetableId, term, examSessions, gradeId, examType];

  factory ExamTimetableModel.empty() {
    return ExamTimetableModel(
      id: '-1',
      timetableId: '',
      term: '',
      examSessions: const [],
      gradeId: '',
      examType: ExamTypeModel.empty(),
    );
  }

  factory ExamTimetableModel.fromMap(Map<String, dynamic> map) {
    return ExamTimetableModel(
      id: map['id'] ?? '',
      timetableId: map['timetableId'] ?? '',
      term: map['term'] ?? '',
      examSessions: (map['examSessions'] as List<dynamic>?)
              ?.map((sessionMap) => ExamSessionModel.fromMap(sessionMap))
              .toList() ??
          [],
      gradeId: map['gradeId'] ?? '',
      examType: ExamTypeModel.fromMap(map['examType'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'timetableId': timetableId,
      'term': term,
      'examSessions': examSessions.map((session) => session.toMap()).toList(),
      'gradeId': gradeId,
      'examType': examType.toMap(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Timetable ID': timetableId,
      'Term': term,
      'Exam Sessions':
          examSessions.map((session) => session.toDisplayMap()).toList(),
      'Grade ID': gradeId,
      'Exam Type': examType.toDisplayMap(),
    };
  }

  @override
  ExamTimetableModel copyWith({
    String? id,
    String? timetableId,
    String? term,
    List<ExamSessionModel>? examSessions,
    String? gradeId,
    ExamTypeModel? examType,
  }) {
    return ExamTimetableModel(
      id: id ?? this.id,
      timetableId: timetableId ?? this.timetableId,
      term: term ?? this.term,
      examSessions: examSessions ?? this.examSessions,
      gradeId: gradeId ?? this.gradeId,
      examType: examType ?? this.examType,
    );
  }
}

class InstructorModel extends UserModel {
  const InstructorModel({
    required super.userName,
    required super.id,
    required super.dateOfBirth,
    required super.phoneNumber,
    required super.address,
    required super.gender,
    required super.email,
    required super.displayName,
    super.role = UserRole.instructor,
    required super.profilePicture,
  });

  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    return InstructorModel(
      userName: map['userName'] ?? '',
      id: map['id'] ?? '',
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      gender: map['gender'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      role: map['role'] == UserRole.admin.name ? UserRole.admin : UserRole.none,
      profilePicture: map['profilePicture'] ?? '',
    );
  }
}

class HomeworkModel extends EduconnectModel {
  final String homeworkId;
  final ClassModel classInfo;
  final SubjectModel subject;
  final DateTime date;
  final String content;

  const HomeworkModel({
    required super.id,
    required this.homeworkId,
    required this.classInfo,
    required this.subject,
    required this.date,
    required this.content,
  });

  @override
  List<Object?> get props =>
      [id, homeworkId, classInfo, subject, date, content];

  factory HomeworkModel.empty() {
    return HomeworkModel(
      id: '-1',
      homeworkId: '',
      classInfo: ClassModel.empty(),
      subject: SubjectModel.empty(),
      date: DateTime.now(),
      content: '',
    );
  }

  factory HomeworkModel.fromMap(Map<String, dynamic> map) {
    return HomeworkModel(
      id: map['id'] ?? '',
      homeworkId: map['homeworkId'] ?? '',
      classInfo: ClassModel.fromMap(map['classInfo'] ?? {}),
      subject: SubjectModel.fromMap(map['subject'] ?? {}),
      date: DateTime.parse(map['date'] ?? ''),
      content: map['content'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'homeworkId': homeworkId,
      'classInfo': classInfo.toMap(),
      'subject': subject.toMap(),
      'date': date.toIso8601String(),
      'content': content,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Homework ID': homeworkId,
      'Class Info': classInfo.toDisplayMap(),
      'Subject': subject.toDisplayMap(),
      'Date': date.toString(),
      'Content': content,
    };
  }

  @override
  HomeworkModel copyWith({
    String? id,
    String? homeworkId,
    ClassModel? classInfo,
    SubjectModel? subject,
    DateTime? date,
    String? content,
  }) {
    return HomeworkModel(
      id: id ?? this.id,
      homeworkId: homeworkId ?? this.homeworkId,
      classInfo: classInfo ?? this.classInfo,
      subject: subject ?? this.subject,
      date: date ?? this.date,
      content: content ?? this.content,
    );
  }
}

class NewsModel extends EduconnectModel {
  final String newsId;
  final String name;
  final String thumbnail;
  final DateTime dateTime;
  final String description;

  const NewsModel({
    required super.id,
    required this.newsId,
    required this.name,
    required this.thumbnail,
    required this.dateTime,
    required this.description,
  });

  @override
  List<Object?> get props =>
      [id, newsId, name, thumbnail, dateTime, description];

  factory NewsModel.empty() {
    return NewsModel(
      id: '-1',
      newsId: '',
      name: '',
      thumbnail: '',
      dateTime: DateTime.now(),
      description: '',
    );
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'] ?? '',
      newsId: map['newsId'] ?? '',
      name: map['name'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      dateTime: DateTime.parse(map['dateTime'] ?? ''),
      description: map['description'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'newsId': newsId,
      'name': name,
      'thumbnail': thumbnail,
      'dateTime': dateTime.toIso8601String(),
      'description': description,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'News ID': newsId,
      'Name': name,
      'Thumbnail': thumbnail,
      'Date Time': dateTime.toString(),
      'Description': description,
    };
  }

  @override
  NewsModel copyWith({
    String? id,
    String? newsId,
    String? name,
    String? thumbnail,
    DateTime? dateTime,
    String? description,
  }) {
    return NewsModel(
      id: id ?? this.id,
      newsId: newsId ?? this.newsId,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      dateTime: dateTime ?? this.dateTime,
      description: description ?? this.description,
    );
  }
}

class AllGradeModel extends EduconnectAllModel {
  const AllGradeModel({required List<GradeModel> items}) : super(items: items);

  factory AllGradeModel.empty() {
    return const AllGradeModel(items: []);
  }

  factory AllGradeModel.fromMap(Map map) {
    final List<GradeModel> items = List<GradeModel>.from(
      map['items'].map(
        (item) => GradeModel.fromMap(item),
      ),
    );
    return AllGradeModel(items: items);
  }
}

class AllClassModel extends EduconnectAllModel {
  const AllClassModel({required List<ClassModel> items}) : super(items: items);

  factory AllClassModel.empty() {
    return const AllClassModel(items: []);
  }

  factory AllClassModel.fromMap(Map map) {
    final List<ClassModel> items = List<ClassModel>.from(
      map['items'].map(
        (item) => ClassModel.fromMap(item),
      ),
    );
    return AllClassModel(items: items);
  }
}

class AllSubjectModel extends EduconnectAllModel {
  const AllSubjectModel({required List<SubjectModel> items})
      : super(items: items);

  factory AllSubjectModel.empty() {
    return const AllSubjectModel(items: []);
  }

  factory AllSubjectModel.fromMap(Map map) {
    final List<SubjectModel> items = List<SubjectModel>.from(
      map['items'].map(
        (item) => SubjectModel.fromMap(item),
      ),
    );
    return AllSubjectModel(items: items);
  }
}

class AllWeeklySessionModel extends EduconnectAllModel {
  const AllWeeklySessionModel({required List<WeeklySessionModel> items})
      : super(items: items);

  factory AllWeeklySessionModel.empty() {
    return const AllWeeklySessionModel(items: []);
  }

  factory AllWeeklySessionModel.fromMap(Map map) {
    final List<WeeklySessionModel> items = List<WeeklySessionModel>.from(
      map['items'].map(
        (item) => WeeklySessionModel.fromMap(item),
      ),
    );
    return AllWeeklySessionModel(items: items);
  }
}

class AllWeeklyTimetableModel extends EduconnectAllModel {
  const AllWeeklyTimetableModel({required List<WeeklyTimetableModel> items})
      : super(items: items);

  factory AllWeeklyTimetableModel.empty() {
    return const AllWeeklyTimetableModel(items: []);
  }

  factory AllWeeklyTimetableModel.fromMap(Map map) {
    final List<WeeklyTimetableModel> items = List<WeeklyTimetableModel>.from(
      map['items'].map(
        (item) => WeeklyTimetableModel.fromMap(item),
      ),
    );
    return AllWeeklyTimetableModel(items: items);
  }
}

class AllExamTypeModel extends EduconnectAllModel {
  const AllExamTypeModel({required List<ExamTypeModel> items})
      : super(items: items);

  factory AllExamTypeModel.empty() {
    return const AllExamTypeModel(items: []);
  }

  factory AllExamTypeModel.fromMap(Map map) {
    final List<ExamTypeModel> items = List<ExamTypeModel>.from(
      map['items'].map(
        (item) => ExamTypeModel.fromMap(item),
      ),
    );
    return AllExamTypeModel(items: items);
  }
}

class AllExamModel extends EduconnectAllModel {
  const AllExamModel({required List<ExamModel> items}) : super(items: items);

  factory AllExamModel.empty() {
    return const AllExamModel(items: []);
  }

  factory AllExamModel.fromMap(Map map) {
    final List<ExamModel> items = List<ExamModel>.from(
      map['items'].map(
        (item) => ExamModel.fromMap(item),
      ),
    );
    return AllExamModel(items: items);
  }
}

class AllExamSessionModel extends EduconnectAllModel {
  const AllExamSessionModel({required List<ExamSessionModel> items})
      : super(items: items);

  factory AllExamSessionModel.empty() {
    return const AllExamSessionModel(items: []);
  }

  factory AllExamSessionModel.fromMap(Map map) {
    final List<ExamSessionModel> items = List<ExamSessionModel>.from(
      map['items'].map(
        (item) => ExamSessionModel.fromMap(item),
      ),
    );
    return AllExamSessionModel(items: items);
  }
}

class AllExamTimetableModel extends EduconnectAllModel {
  const AllExamTimetableModel({required List<ExamTimetableModel> items})
      : super(items: items);

  factory AllExamTimetableModel.empty() {
    return const AllExamTimetableModel(items: []);
  }

  factory AllExamTimetableModel.fromMap(Map map) {
    final List<ExamTimetableModel> items = List<ExamTimetableModel>.from(
      map['items'].map(
        (item) => ExamTimetableModel.fromMap(item),
      ),
    );
    return AllExamTimetableModel(items: items);
  }
}

class AllInstructorModel extends EduconnectAllModel {
  const AllInstructorModel({required List<InstructorModel> items})
      : super(items: items);

  factory AllInstructorModel.empty() {
    return const AllInstructorModel(items: []);
  }

  factory AllInstructorModel.fromMap(Map map) {
    final List<InstructorModel> items = List<InstructorModel>.from(
      map['items'].map(
        (item) => InstructorModel.fromMap(item),
      ),
    );
    return AllInstructorModel(items: items);
  }
}

class AllHomeworkModel extends EduconnectAllModel {
  const AllHomeworkModel({required List<HomeworkModel> items})
      : super(items: items);

  factory AllHomeworkModel.empty() {
    return const AllHomeworkModel(items: []);
  }

  factory AllHomeworkModel.fromMap(Map map) {
    final List<HomeworkModel> items = List<HomeworkModel>.from(
      map['items'].map(
        (item) => HomeworkModel.fromMap(item),
      ),
    );
    return AllHomeworkModel(items: items);
  }
}

class AllNewsModel extends EduconnectAllModel {
  const AllNewsModel({required List<NewsModel> items}) : super(items: items);

  factory AllNewsModel.empty() {
    return const AllNewsModel(items: []);
  }

  factory AllNewsModel.fromMap(Map map) {
    final List<NewsModel> items = List<NewsModel>.from(
      map['items'].map(
        (item) => NewsModel.fromMap(item),
      ),
    );
    return AllNewsModel(items: items);
  }
}
