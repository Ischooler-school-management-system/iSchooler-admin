class IschoolerScheme {
  // Table: user_role
// Columns: id | name
  static final userRole = (
    tableName: 'user_role',
    relatedTables: [],
  );

// Table: admin_role
// Columns: id | name
  static final adminRole = (
    tableName: 'admin_role',
    relatedTables: [],
  );

// Table: school_user
// Columns: id | name | phone_number | address | gender | email | profile_picture | user_role_id
  static const schoolUser = (
    tableName: 'school_user',
    relatedTables: ['user_role'],
  );

// Table: admin
// Columns: school_user_id | specialization(optional) | hire_date | admin_role_id
  static final admin = (
    tableName: 'admin',
    relatedTables: [
      ['admin_role'],
      'school_user',
      schoolUser.relatedTables,
    ],
  );

// Table: instructor
// Columns: school_user_id | date_of_birth | specialization(optional) | hire_date
  static final instructor = (
    tableName: 'instructor',
    relatedTables: [
      schoolUser.relatedTables,
      'school_user',
    ],
  );

// Table: grade
// Columns: id | name
  static final grade = (
    tableName: 'grade',
    relatedTables: [],
  );

// Table: class
// Columns: id | name | grade_id
  static const classTable = (
    tableName: 'class',
    relatedTables: ['grade'],
  );

// Table: subject
// Columns: id | name | total_marks| grade_id
  static const subject = (
    tableName: 'subject',
    relatedTables: ['grade'],
  );

// Table: student
// Columns: school_user_id | guardians_phone_number | payment_status | class_id
  static final student = (
    tableName: 'student',
    relatedTables: ['class', (classTable.relatedTables)],
  );

// Table: instructor_assignment
// Columns: id | name | instructor_id | subject_id | class_id
  static const instructorAssignment = (
    tableName: 'instructor_assignment',
    relatedTables: ['instructor', 'subject', 'class'],
  );

// Table: weekly_timetable
// Columns: id | name | term  | class_id | grade_id
  static const weeklyTimetable = (
    tableName: 'weekly_timetable',
    relatedTables: ['class', 'grade'],
  );

// Table: weekly_sessions
// Columns: id | name  | session_number | weekday | start_time | end_time | session_interval | instructor_assignment_id | weekly_timetable_id
  static const weeklySessions = (
    tableName: 'weekly_sessions',
    relatedTables: ['instructor_assignment', 'weekly_timetable'],
  );

// Table: exam_type
// Columns: id | name | marks_percent
  static final examType = (
    tableName: 'exam_type',
    relatedTables: [],
  );

// Table: exam
// Columns: id | name | date_time | subject_id | exam_type_id
  static const exam = (
    tableName: 'exam',
    relatedTables: ['subject', 'exam_type'],
  );

// Table: exam_timetable
// Columns: id | name | term | grade_id | exam_id
  static const examTimetable = (
    tableName: 'exam_timetable',
    relatedTables: ['grade', 'exam'],
  );

// Table: exam_session
// Columns: id | name | session_number | weekday | start_time | end_time | session_interval | instructor_id | exam_timetable_id
  static const examSession = (
    tableName: 'exam_session',
    relatedTables: ['instructor', 'exam_timetable'],
  );

// Table: homework
// Columns: id | name | date | content | instructor_assignment_id
  static const homework = (
    tableName: 'homework',
    relatedTables: ['instructor_assignment'],
  );

// Table: news
// Columns: id | name | thumbnail | date_time | description
  static final news = (
    tableName: 'news',
    relatedTables: [],
  );
}
