import 'package:cloud_firestore/cloud_firestore.dart';

String classesCollectionPath = 'TestClasses';
String gradeCollectionPath = 'TestGrade';

// CRUD functions for Grades collection
class GradesService {
  var gradeCollection =
      FirebaseFirestore.instance.collection(gradeCollectionPath);
  // Add a grade
  Future<void> addGrade(String gradeName) async {
    await gradeCollection.add({'gradeName': gradeName});
  }

  // Read all grades
  Stream<QuerySnapshot> getGrades() {
    return gradeCollection.snapshots();
  }

  // Get all grades data
  Future<List<DocumentSnapshot>> getAllGradesData() async {
    QuerySnapshot querySnapshot = await gradeCollection.get();
    return querySnapshot.docs;
  }

  // Update a grade
  Future<void> updateGrade(String gradeId, String newName) async {
    await gradeCollection.doc(gradeId).update({'gradeName': newName});
  }

  // Delete a grade
  Future<void> deleteGrade(String gradeId) async {
    await gradeCollection.doc(gradeId).delete();
  }
}

// CRUD functions for Classes collection
class ClassesService {
  var gradeCollection =
      FirebaseFirestore.instance.collection(gradeCollectionPath);
  CollectionReference<Map<String, dynamic>> classCollection(String gradeId) {
    return gradeCollection.doc(gradeId).collection(classesCollectionPath);
  }

// Add a class to a grade
  Future<void> addClassToGrade(String gradeId, String className) async {
    await classCollection(gradeId).add({'className': className});
  }

  // Update a class in a grade
  Future<void> updateClass(
      String gradeId, String classId, String newName) async {
    await classCollection(gradeId).doc(classId).update({'className': newName});
  }

  // Delete a class from a grade
  Future<void> deleteClass(String gradeId, String classId) async {
    await classCollection(gradeId).doc(classId).delete();
  }

  // Read all classes for a grade
  Stream<QuerySnapshot> getClassesForGrade(String gradeId) {
    return classCollection(gradeId).snapshots();
  }

  // Get all classes data for a grade
  Future<List<DocumentSnapshot>> getAllClassesDataForGrade(
      String gradeId) async {
    QuerySnapshot querySnapshot = await classCollection(gradeId).get();
    return querySnapshot.docs;
  }
}

// CRUD functions for Students collection
class StudentsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new student
  Future<void> addStudent(
      String studentName, String gradeId, String classId) async {
    await _firestore.collection('Students').add({
      'studentName': studentName,
      'grade': _firestore.doc('Grades/$gradeId'),
      'class': _firestore.doc('Grades/$gradeId/Classes/$classId')
    });
  }

  // Read all students
  Stream<QuerySnapshot> getStudents() {
    return _firestore.collection('Students').snapshots();
  }

  // Get all students data
  Future<List<DocumentSnapshot>> getAllStudentsData() async {
    QuerySnapshot querySnapshot = await _firestore.collection('Students').get();
    return querySnapshot.docs;
  }

  // Update a student
  Future<void> updateStudent(String studentId, String newName) async {
    await _firestore
        .collection('Students')
        .doc(studentId)
        .update({'studentName': newName});
  }

  // Delete a student
  Future<void> deleteStudent(String studentId) async {
    await _firestore.collection('Students').doc(studentId).delete();
  }
}
