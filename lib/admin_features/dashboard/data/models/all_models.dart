// ignore_for_file: use_super_parameters, overridden_fields

import '../../../../common/educonnect_model.dart';
import '../../../list_models.dart';
import '../../../models.dart';

class ExamTypeModel extends IschoolerModel {
  @override
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
      id: map['id'].toString(),
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

class ExamTypesListModel extends IschoolerListModel {
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

class ExamModel extends IschoolerModel {
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
      id: map['id'].toString(),
      subject: SubjectModel.fromMap(map['subject'] ?? {}),
      date: DateTime.parse(map['date'] ?? ''),
      time: DateTime.parse(map['time'] ?? ''),
      examType: ExamTypeModel.fromMap(map['examType'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'subject': subject.id,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'examType': examType.id,
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
      String? name,
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

class ExamsListModel extends IschoolerListModel {
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

class ExamSessionModel extends IschoolerModel {
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
      id: map['id'].toString(),
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
      // 'instructors': instructors.toMap(),

      'instructors': instructors.items.map((session) => session.id).toList(),
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
    String? name,
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

class ExamSessionsListModel extends IschoolerListModel {
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

class ExamTimetableModel extends IschoolerModel {
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
      id: map['id'].toString(),
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
      'examSessions': examSessions.map((session) => session.id).toList(),
      'gradeId': grade,
      'examType': examType.id,
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
    String? name,
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

class ExamTimetablesListModel extends IschoolerListModel {
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

class HomeworksListModel extends IschoolerListModel {
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

class HomeworkModel extends IschoolerModel {
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
      id: map['id'].toString(),
      classInfo: ClassModel.fromMap(map['classInfo'] ?? {}),
      subject: SubjectModel.fromMap(map['subject'] ?? {}),
      date: DateTime.parse(map['date'] ?? ''),
      content: map['content'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'class_id': classInfo.id,
      'subject_id': subject.id,
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
    String? name,
    ClassModel? classModel,
    SubjectModel? subject,
    DateTime? date,
    String? content,
  }) {
    return HomeworkModel(
      id: id ?? this.id,
      classInfo: classModel ?? classInfo,
      subject: subject ?? this.subject,
      date: date ?? this.date,
      content: content ?? this.content,
    );
  }
}

class NewsModel extends IschoolerModel {
  @override
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
      id: map['id'].toString(),
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

class NewsListModel extends IschoolerListModel {
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
