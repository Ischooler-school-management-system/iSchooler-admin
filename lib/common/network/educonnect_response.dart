import 'package:cloud_firestore/cloud_firestore.dart';

import '../madpoly.dart';

class EduconnectResponse {
  final bool hasData;
  final Map<String, dynamic> data;

  EduconnectResponse({
    required this.hasData,
    required this.data,
  });
  factory EduconnectResponse.empty() {
    return EduconnectResponse(hasData: false, data: {});
  }

  factory EduconnectResponse.fromCollection(QuerySnapshot query) {
    List<Map<String, dynamic>> response = [];
    try {
      for (var doc in query.docs) {
        Map<String, dynamic> dataMap = doc.data() as Map<String, dynamic>;
        dataMap['id'] = doc.id; // Add the document ID to the map
        response.add(dataMap);
      }
      Madpoly.print(
        'dataMap = $response',
        tag: 'educonnectResponse > fromCollection',
      );
    } catch (e) {
      Madpoly.print(
        'Error: $e',
        tag: 'educonnectResponse > fromCollection',
        developer: "Ziad",
      );
    }
    return EduconnectResponse(
      hasData: response.isNotEmpty,
      data: {'items': response},
    );
  }

  factory EduconnectResponse.fromDocument(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> response = {};
    try {
      if (documentSnapshot.exists) {
        response = documentSnapshot.data() as Map<String, dynamic>;
        response['id'] = documentSnapshot.id; // Add the document ID to the map
        Madpoly.print(
          'dataMap = $response',
          tag: 'educonnectResponse > fromDocument',
        );
      } else {
        Madpoly.print(
          'Document does not exist',
          tag: 'educonnectResponse > fromDocument',
        );
      }
    } catch (e) {
      Madpoly.print(
        'Error: $e',
        tag: 'educonnectResponse > fromDocument',
      );
    }
    return EduconnectResponse(
      hasData: response.isNotEmpty,
      data: response,
    );
  }

/* 
  Map<String, dynamic>? getDocumentData(DocumentSnapshot documentSnapshot) {
   
  } */
}
