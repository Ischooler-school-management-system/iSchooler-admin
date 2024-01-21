import '../../../../common/educonnect_model.dart';
import '../../../users/instructor/data/models/instructor_model.dart';
import '../../../users/instructor/data/models/instructors_list_model.dart';

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
  // final String gradeId;
  final String name;

  const GradeModel({
    required super.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory GradeModel.empty() {
    return const GradeModel(id: '-1', name: '');
  }
  factory GradeModel.dummy() {
    return const GradeModel(
      id: '1',
      name: 'Excellent',
    );
  }
  factory GradeModel.fromMap(Map<String, dynamic> map) {
    return GradeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Name': name,
    };
  }

  @override
  GradeModel copyWith({String? id, String? grade, String? name}) {
    return GradeModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

class ClassModel extends EduconnectModel {
  final String className;
  final GradeModel grade; // Injecting GradeModel object

  const ClassModel({
    required super.id,
    required this.className,
    required this.grade,
  });

  @override
  List<Object?> get props => [id, className, grade];

  factory ClassModel.empty() {
    return ClassModel(id: '-1', className: '', grade: GradeModel.empty());
  }

  factory ClassModel.dummy() {
    return ClassModel(
      id: '1',
      className: 'Mathematics',
      grade: GradeModel.dummy(),
    );
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      id: map['id'] ?? '',
      className: map['className'] ?? '',
      grade: GradeModel.fromMap(map['grade'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'className': className,
      'grade': grade.toMap(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Class Name': className,
      'Grade': grade.toDisplayMap(),
    };
  }

  @override
  ClassModel copyWith(
      {String? id, String? classId, String? className, GradeModel? grade}) {
    return ClassModel(
      id: id ?? this.id,
      className: className ?? this.className,
      grade: grade ?? this.grade,
    );
  }
}

class SubjectModel extends EduconnectModel {
  final String name;
  final GradeModel grade; // Injecting GradeModel object
  final int totalMarks;

  const SubjectModel({
    required super.id,
    required this.name,
    required this.grade,
    required this.totalMarks,
  });

  @override
  List<Object?> get props => [id, name, grade, totalMarks];

  factory SubjectModel.empty() {
    return SubjectModel(
        id: '-1', name: '', grade: GradeModel.empty(), totalMarks: 0);
  }
  factory SubjectModel.dummy() {
    return SubjectModel(
      id: '1',
      name: 'Introduction to Computer Science',
      grade: GradeModel.dummy(),
      totalMarks: 100,
    );
  }
  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      grade: GradeModel.fromMap(map['grade'] ?? {}),
      totalMarks: map['totalMarks'] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'grade': grade.toMap(),
      'totalMarks': totalMarks,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Name': name,
      'Grade': grade.toDisplayMap(),
      'Total Marks': totalMarks,
    };
  }

  @override
  SubjectModel copyWith({
    String? id,
    String? name,
    GradeModel? grade,
    int? totalMarks,
  }) {
    return SubjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      totalMarks: totalMarks ?? this.totalMarks,
    );
  }
}

class WeeklySessionModel extends EduconnectModel {
  final int sessionNumber;
  final String weekday;
  final DateTime startTime;
  final DateTime endTime;
  final int sessionInterval;
  final SubjectModel subject;
  final String? instructor; // Optional

  const WeeklySessionModel({
    required super.id,
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
      sessionNumber: 0,
      weekday: '',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      sessionInterval: 0,
      subject: SubjectModel.empty(),
      instructor: null,
    );
  }
  factory WeeklySessionModel.dummy() {
    return WeeklySessionModel(
      id: '1', // You can assign a unique ID for the dummy data
      sessionNumber: 1,
      weekday: 'Monday',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      sessionInterval: 60,
      subject: SubjectModel.dummy(),
      instructor: 'John Doe',
    );
  }
  factory WeeklySessionModel.fromMap(Map<String, dynamic> map) {
    return WeeklySessionModel(
      id: map['id'] ?? '',
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
  final ClassModel classInfo;
  final String term;
  final List<WeeklySessionModel> weeklySessions;
  final GradeModel grade;

  const WeeklyTimetableModel({
    required super.id,
    required this.classInfo,
    required this.term,
    required this.weeklySessions,
    required this.grade,
  });

  @override
  List<Object?> get props => [
        id,
        classInfo,
        term,
        weeklySessions,
        grade,
      ];

  factory WeeklyTimetableModel.empty() {
    return WeeklyTimetableModel(
      id: '-1',
      classInfo: ClassModel.empty(),
      term: '',
      weeklySessions: const [],
      grade: GradeModel.empty(),
    );
  }
  factory WeeklyTimetableModel.dummy() {
    return WeeklyTimetableModel(
      id: '1', // You can assign a unique ID for the dummy data
      classInfo: ClassModel.dummy(),
      term: 'Fall 2024',
      weeklySessions: [WeeklySessionModel.dummy()],
      grade: GradeModel.dummy(),
    );
  }

  factory WeeklyTimetableModel.fromMap(Map<String, dynamic> map) {
    return WeeklyTimetableModel(
      id: map['id'] ?? '',
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
    ClassModel? classInfo,
    String? term,
    List<WeeklySessionModel>? weeklySessions,
    GradeModel? grade,
  }) {
    return WeeklyTimetableModel(
      id: id ?? this.id,
      classInfo: classInfo ?? this.classInfo,
      term: term ?? this.term,
      weeklySessions: weeklySessions ?? this.weeklySessions,
      grade: grade ?? this.grade,
    );
  }
}

class ExamTypeModel extends EduconnectModel {
  final String name;
  final double marksPercent;

  const ExamTypeModel({
    required super.id,
    required this.name,
    required this.marksPercent,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        marksPercent,
      ];

  factory ExamTypeModel.empty() {
    return const ExamTypeModel(
      id: '-1',
      name: '',
      marksPercent: 0.0,
    );
  }
  factory ExamTypeModel.dummy() {
    return const ExamTypeModel(
      id: '1', // You can assign a unique ID for the dummy data
      name: 'Midterm Exam',
      marksPercent: 30.0,
    );
  }
  factory ExamTypeModel.fromMap(Map<String, dynamic> map) {
    return ExamTypeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      marksPercent: map['marksPercent'] ?? 0.0,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'marksPercent': marksPercent,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Name': name,
      'Marks Percent': marksPercent,
    };
  }

  @override
  ExamTypeModel copyWith({
    String? id,
    String? name,
    double? marksPercent,
  }) {
    return ExamTypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      marksPercent: marksPercent ?? this.marksPercent,
    );
  }
}

class ExamModel extends EduconnectModel {
  final SubjectModel subject;
  final DateTime date;
  final DateTime time;
  final ExamTypeModel examType;

  const ExamModel({
    required super.id,
    required this.subject,
    required this.date,
    required this.time,
    required this.examType,
  });

  @override
  List<Object?> get props => [
        id,
        subject,
        date,
        time,
        examType,
      ];

  factory ExamModel.empty() {
    return ExamModel(
        id: '-1',
        subject: SubjectModel.empty(),
        date: DateTime.now(),
        time: DateTime.now(),
        examType: ExamTypeModel.empty());
  }
  factory ExamModel.dummy() {
    return ExamModel(
      id: '1', // You can assign a unique ID for the dummy data
      subject: SubjectModel.dummy(),
      date: DateTime.now().add(const Duration(days: 7)),
      time: DateTime.now().add(const Duration(hours: 14)),
      examType: ExamTypeModel.dummy(),
    );
  }
  factory ExamModel.fromMap(Map<String, dynamic> map) {
    return ExamModel(
      id: map['id'] ?? '',
      subject: SubjectModel.fromMap(map['subject'] ?? {}),
      date: DateTime.parse(map['date'] ?? ''),
      time: DateTime.parse(map['time'] ?? ''),
      examType: ExamTypeModel.fromMap(map['examType'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'subject': subject.toMap(),
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'examType': examType.toMap(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Subject': subject.toDisplayMap(),
      'Date': date.toString(),
      'Time': time.toString(),
      'Exam Type': examType.toDisplayMap(),
    };
  }

  @override
  ExamModel copyWith(
      {String? id,
      SubjectModel? subject,
      DateTime? date,
      DateTime? time,
      ExamTypeModel? examType}) {
    return ExamModel(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      date: date ?? this.date,
      time: time ?? this.time,
      examType: examType ?? this.examType,
    );
  }
}

class ExamSessionModel extends EduconnectModel {
  final int sessionNumber;
  final String weekday;
  final DateTime startTime;
  final DateTime endTime;
  final SubjectModel subject;
  final int sessionInterval;
  final InstructorsListModel instructors; // Optional

  const ExamSessionModel({
    required super.id,
    required this.sessionNumber,
    required this.weekday,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.sessionInterval,
    required this.instructors,
  });

  @override
  List<Object?> get props => [
        id,
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
      sessionNumber: 0,
      weekday: '',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      subject: SubjectModel.empty(),
      sessionInterval: 0,
      instructors: InstructorsListModel.empty(),
    );
  }
  factory ExamSessionModel.dummy() {
    return ExamSessionModel(
      id: '1', // You can assign a unique ID for the dummy data
      sessionNumber: 1,
      weekday: 'Monday',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: SubjectModel.dummy(),
      sessionInterval: 60,
      instructors: InstructorsListModel.dummy(),
    );
  }
  factory ExamSessionModel.fromMap(Map<String, dynamic> map) {
    return ExamSessionModel(
      id: map['id'] ?? '',
      sessionNumber: map['sessionNumber'] ?? 0,
      weekday: map['weekday'] ?? '',
      startTime: DateTime.parse(map['startTime'] ?? ''),
      endTime: DateTime.parse(map['endTime'] ?? ''),
      subject: SubjectModel.fromMap(map['subject'] ?? {}),
      sessionInterval: map['sessionInterval'] ?? 0,
      instructors: InstructorsListModel.fromMap(map['instructors'] ?? {}),
      /* (map['instructors'] as List<dynamic>?)
              ?.map((instructorMap) => InstructorModel.fromMap(instructorMap))
              .toList() ??
          [], */
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'sessionNumber': sessionNumber,
      'weekday': weekday,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'subject': subject.toMap(),
      'sessionInterval': sessionInterval,
      'instructors': instructors.toMap(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Session Number': sessionNumber,
      'Weekday': weekday,
      'Start Time': startTime.toString(),
      'End Time': endTime.toString(),
      'Subject': subject.toDisplayMap(),
      'Session Interval': sessionInterval,
      'instructors': instructors.toMap(),
    };
  }

  @override
  ExamSessionModel copyWith({
    String? id,
    int? sessionNumber,
    String? weekday,
    DateTime? startTime,
    DateTime? endTime,
    SubjectModel? subject,
    int? sessionInterval,
    InstructorsListModel? instructors,
  }) {
    return ExamSessionModel(
      id: id ?? this.id,
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
  final String term;
  final List<ExamSessionModel> examSessions;
  final GradeModel grade;
  final ExamTypeModel examType;

  const ExamTimetableModel({
    required super.id,
    required this.term,
    required this.examSessions,
    required this.grade,
    required this.examType,
  });

  @override
  List<Object?> get props => [
        id,
        term,
        examSessions,
        grade,
        examType,
      ];

  factory ExamTimetableModel.empty() {
    return ExamTimetableModel(
      id: '-1',
      term: '',
      examSessions: const [],
      grade: GradeModel.empty(),
      examType: ExamTypeModel.empty(),
    );
  }
  factory ExamTimetableModel.dummy() {
    return ExamTimetableModel(
      id: '1', // You can assign a unique ID for the dummy data
      term: 'Fall 2024',
      examSessions: [ExamSessionModel.dummy()],
      examType: ExamTypeModel.dummy(), grade: GradeModel.dummy(),
    );
  }
  factory ExamTimetableModel.fromMap(Map<String, dynamic> map) {
    return ExamTimetableModel(
      id: map['id'] ?? '',
      term: map['term'] ?? '',
      examSessions: (map['examSessions'] as List<dynamic>?)
              ?.map((sessionMap) => ExamSessionModel.fromMap(sessionMap))
              .toList() ??
          [],
      grade: GradeModel.fromMap(map['grade'] ?? {}),
      examType: ExamTypeModel.fromMap(map['examType'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'term': term,
      'examSessions': examSessions.map((session) => session.toMap()).toList(),
      'gradeId': grade,
      'examType': examType.toMap(),
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Term': term,
      'Exam Sessions':
          examSessions.map((session) => session.toDisplayMap()).toList(),
      'Grade ID': grade,
      'Exam Type': examType.toDisplayMap(),
    };
  }

  @override
  ExamTimetableModel copyWith({
    String? id,
    String? term,
    List<ExamSessionModel>? examSessions,
    GradeModel? grade,
    ExamTypeModel? examType,
  }) {
    return ExamTimetableModel(
      id: id ?? this.id,
      term: term ?? this.term,
      examSessions: examSessions ?? this.examSessions,
      grade: grade ?? this.grade,
      examType: examType ?? this.examType,
    );
  }
}

class HomeworkModel extends EduconnectModel {
  final ClassModel classInfo;
  final SubjectModel subject;
  final DateTime date;
  final String content;

  const HomeworkModel({
    required super.id,
    required this.classInfo,
    required this.subject,
    required this.date,
    required this.content,
  });

  @override
  List<Object?> get props => [
        id,
        classInfo,
        subject,
        date,
        content,
      ];

  factory HomeworkModel.empty() {
    return HomeworkModel(
      id: '-1',
      classInfo: ClassModel.empty(),
      subject: SubjectModel.empty(),
      date: DateTime.now(),
      content: '',
    );
  }
  factory HomeworkModel.dummy() {
    return HomeworkModel(
      id: '1', // You can assign a unique ID for the dummy data
      classInfo: ClassModel.dummy(),
      subject: SubjectModel.dummy(),
      date: DateTime.now().add(const Duration(days: 7)),
      content: 'Sample homework content',
    );
  }
  factory HomeworkModel.fromMap(Map<String, dynamic> map) {
    return HomeworkModel(
      id: map['id'] ?? '',
      classInfo: ClassModel.fromMap(map['classInfo'] ?? {}),
      subject: SubjectModel.fromMap(map['subject'] ?? {}),
      date: DateTime.parse(map['date'] ?? ''),
      content: map['content'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'classInfo': classInfo.toMap(),
      'subject': subject.toMap(),
      'date': date.toIso8601String(),
      'content': content,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Class Info': classInfo.toDisplayMap(),
      'Subject': subject.toDisplayMap(),
      'Date': date.toString(),
      'Content': content,
    };
  }

  @override
  HomeworkModel copyWith({
    String? id,
    ClassModel? classInfo,
    SubjectModel? subject,
    DateTime? date,
    String? content,
  }) {
    return HomeworkModel(
      id: id ?? this.id,
      classInfo: classInfo ?? this.classInfo,
      subject: subject ?? this.subject,
      date: date ?? this.date,
      content: content ?? this.content,
    );
  }
}

class NewsModel extends EduconnectModel {
  final String name;
  final String thumbnail;
  final DateTime dateTime;
  final String description;

  const NewsModel({
    required super.id,
    required this.name,
    required this.thumbnail,
    required this.dateTime,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        thumbnail,
        dateTime,
        description,
      ];

  factory NewsModel.empty() {
    return NewsModel(
      id: '-1',
      name: '',
      thumbnail: '',
      dateTime: DateTime.now(),
      description: '',
    );
  }
  factory NewsModel.dummy() {
    return NewsModel(
      id: '1', // You can assign a unique ID for the dummy data
      name: 'Sample News',
      thumbnail: 'https://example.com/thumbnail.jpg',
      dateTime: DateTime.now(),
      description: 'Sample news description',
    );
  }
  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      dateTime: DateTime.parse(map['dateTime'] ?? ''),
      description: map['description'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'thumbnail': thumbnail,
      'dateTime': dateTime.toIso8601String(),
      'description': description,
    };
  }

  @override
  Map<String, dynamic> toDisplayMap() {
    return {
      'Name': name,
      'Thumbnail': thumbnail,
      'Date Time': dateTime.toString(),
      'Description': description,
    };
  }

  @override
  NewsModel copyWith({
    String? id,
    String? name,
    String? thumbnail,
    DateTime? dateTime,
    String? description,
  }) {
    return NewsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      dateTime: dateTime ?? this.dateTime,
      description: description ?? this.description,
    );
  }
}

class GradesListModel extends EduconnectModelList {
  const GradesListModel({required List<GradeModel> items})
      : super(items: items);

  factory GradesListModel.empty() {
    return const GradesListModel(items: []);
  }
  factory GradesListModel.dummy() {
    return GradesListModel(items: [
      GradeModel.dummy(),
      GradeModel.dummy(),
      GradeModel.dummy(),
      GradeModel.dummy(),
    ]);
  }

  factory GradesListModel.fromMap(Map map) {
    final List<GradeModel> items = List<GradeModel>.from(
      map['items'].map(
        (item) => GradeModel.fromMap(item),
      ),
    );
    return GradesListModel(items: items);
  }
}

class ClassesListModel extends EduconnectModelList {
  const ClassesListModel({required List<ClassModel> items})
      : super(items: items);

  factory ClassesListModel.empty() {
    return const ClassesListModel(items: []);
  }
  factory ClassesListModel.dummy() {
    return ClassesListModel(items: [
      ClassModel.dummy(),
      ClassModel.dummy(),
      ClassModel.dummy(),
      ClassModel.dummy(),
    ]);
  }
  factory ClassesListModel.fromMap(Map map) {
    final List<ClassModel> items = List<ClassModel>.from(
      map['items'].map(
        (item) => ClassModel.fromMap(item),
      ),
    );
    return ClassesListModel(items: items);
  }
}

class SubjectsListModel extends EduconnectModelList {
  const SubjectsListModel({required List<SubjectModel> items})
      : super(items: items);

  factory SubjectsListModel.empty() {
    return const SubjectsListModel(items: []);
  }
  factory SubjectsListModel.dummy() {
    return SubjectsListModel(items: [
      SubjectModel.dummy(),
      SubjectModel.dummy(),
      SubjectModel.dummy(),
      SubjectModel.dummy(),
    ]);
  }
  factory SubjectsListModel.fromMap(Map map) {
    final List<SubjectModel> items = List<SubjectModel>.from(
      map['items'].map(
        (item) => SubjectModel.fromMap(item),
      ),
    );
    return SubjectsListModel(items: items);
  }
}

class WeeklySessionsListModel extends EduconnectModelList {
  const WeeklySessionsListModel({required List<WeeklySessionModel> items})
      : super(items: items);

  factory WeeklySessionsListModel.empty() {
    return const WeeklySessionsListModel(items: []);
  }
  factory WeeklySessionsListModel.dummy() {
    return WeeklySessionsListModel(items: [
      WeeklySessionModel.dummy(),
      WeeklySessionModel.dummy(),
      WeeklySessionModel.dummy(),
      WeeklySessionModel.dummy(),
    ]);
  }

  factory WeeklySessionsListModel.fromMap(Map map) {
    final List<WeeklySessionModel> items = List<WeeklySessionModel>.from(
      map['items'].map(
        (item) => WeeklySessionModel.fromMap(item),
      ),
    );
    return WeeklySessionsListModel(items: items);
  }
}

class WeeklyTimetablesListModel extends EduconnectModelList {
  const WeeklyTimetablesListModel({required List<WeeklyTimetableModel> items})
      : super(items: items);

  factory WeeklyTimetablesListModel.empty() {
    return const WeeklyTimetablesListModel(items: []);
  }
  factory WeeklyTimetablesListModel.dummy() {
    return WeeklyTimetablesListModel(items: [
      WeeklyTimetableModel.empty(),
      WeeklyTimetableModel.empty(),
      WeeklyTimetableModel.empty(),
      // Add more instances as needed
    ]);
  }
  factory WeeklyTimetablesListModel.fromMap(Map map) {
    final List<WeeklyTimetableModel> items = List<WeeklyTimetableModel>.from(
      map['items'].map(
        (item) => WeeklyTimetableModel.fromMap(item),
      ),
    );
    return WeeklyTimetablesListModel(items: items);
  }
}

class ExamTypesListModel extends EduconnectModelList {
  const ExamTypesListModel({required List<ExamTypeModel> items})
      : super(items: items);

  factory ExamTypesListModel.empty() {
    return const ExamTypesListModel(items: []);
  }
  factory ExamTypesListModel.dummy() {
    return ExamTypesListModel(items: [
      ExamTypeModel.empty(),
      ExamTypeModel.empty(),
      ExamTypeModel.empty(),
      // Add more instances as needed
    ]);
  }

  factory ExamTypesListModel.fromMap(Map map) {
    final List<ExamTypeModel> items = List<ExamTypeModel>.from(
      map['items'].map(
        (item) => ExamTypeModel.fromMap(item),
      ),
    );
    return ExamTypesListModel(items: items);
  }
}

class ExamsListModel extends EduconnectModelList {
  const ExamsListModel({required List<ExamModel> items}) : super(items: items);

  factory ExamsListModel.empty() {
    return const ExamsListModel(items: []);
  }
  factory ExamsListModel.dummy() {
    return ExamsListModel(items: [
      ExamModel.empty(),
      ExamModel.empty(),
      ExamModel.empty(),
      // Add more instances as needed
    ]);
  }

  factory ExamsListModel.fromMap(Map map) {
    final List<ExamModel> items = List<ExamModel>.from(
      map['items'].map(
        (item) => ExamModel.fromMap(item),
      ),
    );
    return ExamsListModel(items: items);
  }
}

class ExamSessionsListModel extends EduconnectModelList {
  const ExamSessionsListModel({required List<ExamSessionModel> items})
      : super(items: items);

  factory ExamSessionsListModel.empty() {
    return const ExamSessionsListModel(items: []);
  }
  factory ExamSessionsListModel.dummy() {
    return ExamSessionsListModel(items: [
      ExamSessionModel.empty(),
      ExamSessionModel.empty(),
      ExamSessionModel.empty(),
      // Add more instances as needed
    ]);
  }
  factory ExamSessionsListModel.fromMap(Map map) {
    final List<ExamSessionModel> items = List<ExamSessionModel>.from(
      map['items'].map(
        (item) => ExamSessionModel.fromMap(item),
      ),
    );
    return ExamSessionsListModel(items: items);
  }
}

class ExamTimetablesListModel extends EduconnectModelList {
  const ExamTimetablesListModel({required List<ExamTimetableModel> items})
      : super(items: items);

  factory ExamTimetablesListModel.empty() {
    return const ExamTimetablesListModel(items: []);
  }

  factory ExamTimetablesListModel.dummy() {
    return ExamTimetablesListModel(items: [
      ExamTimetableModel.empty(),
      ExamTimetableModel.empty(),
      ExamTimetableModel.empty(),
      // Add more instances as needed
    ]);
  }

  factory ExamTimetablesListModel.fromMap(Map map) {
    final List<ExamTimetableModel> items = List<ExamTimetableModel>.from(
      map['items'].map(
        (item) => ExamTimetableModel.fromMap(item),
      ),
    );
    return ExamTimetablesListModel(items: items);
  }
}

class HomeworksListModel extends EduconnectModelList {
  const HomeworksListModel({required List<HomeworkModel> items})
      : super(items: items);

  factory HomeworksListModel.empty() {
    return const HomeworksListModel(items: []);
  }

  factory HomeworksListModel.dummy() {
    return HomeworksListModel(items: [
      HomeworkModel.empty(),
      HomeworkModel.empty(),
      HomeworkModel.empty(),
      // Add more instances as needed
    ]);
  }

  factory HomeworksListModel.fromMap(Map map) {
    final List<HomeworkModel> items = List<HomeworkModel>.from(
      map['items'].map(
        (item) => HomeworkModel.fromMap(item),
      ),
    );
    return HomeworksListModel(items: items);
  }
}

class NewsListModel extends EduconnectModelList {
  const NewsListModel({required List<NewsModel> items}) : super(items: items);

  factory NewsListModel.empty() {
    return const NewsListModel(items: []);
  }

  factory NewsListModel.dummy() {
    return NewsListModel(items: [
      NewsModel.empty(),
      NewsModel.empty(),
      NewsModel.empty(),
      // Add more instances as needed
    ]);
  }

  factory NewsListModel.fromMap(Map map) {
    final List<NewsModel> items = List<NewsModel>.from(
      map['items'].map(
        (item) => NewsModel.fromMap(item),
      ),
    );
    return NewsListModel(items: items);
  }
}
