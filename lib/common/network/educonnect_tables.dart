import '../madpoly.dart';

class DatabaseTable {
  final String tableName;
  final List<DatabaseTable>? relatedTablesList;
  final String selectQuery;
  final ({
    String? columnName,
    String? referencedTable,
  }) orderBy;

  DatabaseTable({
    required this.tableName,
    this.relatedTablesList,
    String? selectQuery,
    this.orderBy = (columnName: null, referencedTable: null),
  }) : selectQuery = selectQuery ?? selectQueryMaker(relatedTablesList);
  factory DatabaseTable.empty() {
    return DatabaseTable(
      tableName: '',
      selectQuery: '',
    );
  }
  String tableSelectQueryMaker() {
    var result = '$tableName($selectQuery)';
    Madpoly.print(
      'result = ',
      inspectObject: result,
      tag: 'educonnect_tables > tableSelectQueryMaker',
      developer: "Ziad",
    );
    return result;
  }

  static String selectQueryMaker(List<DatabaseTable>? relatedTablesList) {
    if (relatedTablesList == null || relatedTablesList.isEmpty) {
      return '*';
    }
    String result = '*, ';
    for (var element in relatedTablesList) {
      result += element.tableSelectQueryMaker();
      if (element != relatedTablesList.last) {
        result += ',';
      }
    }
    // result = result.replaceAll('),', ')');
    // result += ')' * ((relatedTablesList.length) + 1);
    return result;
  }

  @override
  String toString() {
    return 'DatabaseTable{tableName: $tableName, selectQuery: $selectQuery}';
  }
}

class IschoolerTables {
  static final DatabaseTable userRole = DatabaseTable(
    tableName: 'user_role',
    selectQuery: '*',
  );

  // admin_role: id | name
  static final DatabaseTable adminRole = DatabaseTable(
    tableName: 'admin_role',
    selectQuery: '*',
  );

  // school_user: id | name | phone_number | address | gender | email | profile_picture | user_role_id
  static final DatabaseTable schoolUser = DatabaseTable(
    tableName: 'school_user',
    selectQuery: '*',
  );

  // admin: school_user_id | specialization(optional) | hire_date | admin_role_id
  static final DatabaseTable admin = DatabaseTable(
    tableName: 'admin',
    // selectQuery: '*,admin_role(*)',
    selectQuery: '*,${adminRole.tableSelectQueryMaker()}',
  );

  // instructor: school_user_id | date_of_birth | specialization(optional) | hire_date
  static final DatabaseTable instructor = DatabaseTable(
    tableName: 'instructor',
    selectQuery: '*',
  );

  // grade: id | name
  static final DatabaseTable grade = DatabaseTable(
    tableName: 'grade',
    selectQuery: '*',
  );

  // class: id | name | grade_id
  static final DatabaseTable classTable = DatabaseTable(
    tableName: 'class',
    // selectQuery: '*,grade(*)',
    relatedTablesList: [grade],
    // selectQuery: '*,${grade.tableSelectQueryMaker()}',
  );

  // subject: id | name | total_marks | grade_id
  static final DatabaseTable subject = DatabaseTable(
    tableName: 'subject',
    // selectQuery: '*,grade(*)',
    orderBy: (columnName: 'name', referencedTable: 'grade'),
    relatedTablesList: [grade],

    // selectQuery: '*,${grade.tableSelectQueryMaker()}',
  );

  // student: school_user_id | guardians_phone_number | payment_status | class_id
  static final DatabaseTable student = DatabaseTable(
    tableName: 'student',
    // selectQuery: '*,class(*,grade(*)))',
    relatedTablesList: [classTable],

    // selectQuery: '*,${classTable.tableSelectQueryMaker()}',
  );

  // instructor_assignment: id | name | instructor_id | subject_id | class_id |
  static final DatabaseTable instructorAssignment = DatabaseTable(
    tableName: 'instructor_assignment',
    // selectQuery: '*,instructor(*),class(*,grade(*)),subject(*,grade(*)))',
    relatedTablesList: [instructor, subject, classTable],
    // selectQuery:
    // '*,${instructor.tableSelectQueryMaker()},${classTable.tableSelectQueryMaker()},${subject.tableSelectQueryMaker()}',
  );

  // weekly_timetable: id | name | term | class_id |
  static final DatabaseTable weeklyTimetable = DatabaseTable(
    tableName: 'weekly_timetable',
    // selectQuery: '*,class(*,grade(*))',
    relatedTablesList: [classTable],
    // selectQuery: '*,${classTable.tableSelectQueryMaker()}',
  );

  // weekly_sessions: id | name | session_number | weekday | start_time | end_time | session_interval | instructor_assignment_id | weekly_timetable_id
  static final DatabaseTable weeklySessions = DatabaseTable(
    tableName: 'weekly_sessions',
    // selectQuery:
    // '*,instructor_assignment(*,instructor(*),class(*,grade(*)),subject(*,grade(*)))),weekly_timetable(*,class(*,grade(*)))',

    relatedTablesList: [instructorAssignment, weeklyTimetable],
    // selectQuery:
    // '*,${instructorAssignment.tableSelectQueryMaker()},${weeklyTimetable.tableSelectQueryMaker()}',
  );
  static final DatabaseTable weekday = DatabaseTable(
    tableName: 'weekday',
    relatedTablesList: [],
  );

  // exam_type: id | name | marks_percent
  static final DatabaseTable examType = DatabaseTable(
    tableName: 'exam_type',
    selectQuery: '*',
  );

  // exam: id | name | date_time | subject_id | exam_type_id
  static final DatabaseTable exam = DatabaseTable(
    tableName: 'exam',
    relatedTablesList: [subject, examType],

    // selectQuery: '*,subject(*,grade(*)),exam_type(*)',
    selectQuery: '*,subject(*,grade(*)),exam_type(*)',
  );

  // exam_timetable: id | name | term | grade_id | exam_id
  static final DatabaseTable examTimetable = DatabaseTable(
    tableName: 'exam_timetable',
    relatedTablesList: [exam, examType],

    // selectQuery: '*,exam(*,subject(*,grade(*)),exam_type(*))',
  );

  // exam_session: id | name | session_number | weekday | start_time | end_time | session_interval | instructor_id | exam_timetable_id
  static final DatabaseTable examSession = DatabaseTable(
    tableName: 'exam_session',
    relatedTablesList: [instructor, examTimetable],

    // selectQuery:
    // '*,exam_session(*),*,exam_timetable(*,exam(*,subject(*,grade(*)),exam_type(*)))',
  );

  // homework: id | name | date | content | instructor_assignment_id
  static final DatabaseTable homework = DatabaseTable(
    tableName: 'homework',
    relatedTablesList: [instructorAssignment],

    // selectQuery: '*,exam_session()',
  );

  // news: id | name | thumbnail | date_time | description
  static final DatabaseTable news = DatabaseTable(
    tableName: 'news',
    selectQuery: '*',
  );
}
