/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/features/widgets/buttons/educonnect_button.dart';
import 'common/features/widgets/buttons/models/buttons_model.dart';
import 'common/features/widgets/educonnect_screen.dart';
import 'common/madpoly.dart';
import 'common/network/collections.dart';
import 'common/network/educonnect_response.dart';
import 'features/users/students/data/models/student_model.dart';
import 'features/users/students/logic/cubit/student_cubit.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
        keepMobileView: true,
        alignment: Alignment.center,
        body: Column(
          children: [
            EduconnectButton(
              button: EduconnectElevatedButton(
                onPressed: () {
                  context.read<StudentCubit>().storeStudentData(
                        student: StudentModel(
                          id: '123',
                          displayName: 'ziad',
                          studentName: 'Ziad Hesham',
                          dateOfBirth: DateTime(2000, 1, 1),
                          classId: '102',
                          gradeId: 'A',
                          phoneNumber: '1134567890',
                          address: '123 Mains St',
                          paymentStatus: true,
                          gender: 'Male',
                          email: 'ziad11@mail.com',
                        ),
                      );
                },
                text: 'add',
              ),
            ),
            EduconnectButton(
              button: EduconnectElevatedButton(
                onPressed: () {
                  getCollectionData();
                },
                text: 'get',
              ),
            ),

            EduconnectButton(
              button: EduconnectElevatedButton(
                onPressed: () {
                  getDocRequest(
                      collectionName: 'students',
                      documentId: 'PSspTvt2CQzHyO1EQzRx');
                },
                text: 'get one',
              ),
            ),
            // Text(data)
          ],
        ));
  }

  getDocRequest({
    required String collectionName,
    required String documentId,
  }) async {
    DocumentSnapshot documentSnapshot = await EduconnectNetwork
        .fireStoreInstance
        .collection(collectionName)
        .doc(documentId)
        .get();
    return EduconnectResponse.fromDocument(documentSnapshot);
  }

  Future<void> getCollectionData() async {
    String collectionName =
        'students'; // Replace with your actual collection name

    try {
      CollectionReference collectionReference =
          EduconnectNetwork.fireStoreInstance.collection(collectionName);
      QuerySnapshot querySnapshot = await collectionReference.get();

      /* List<Map<String, dynamic>> dataList =
          await getDataFromQuerySnapshot(querySnapshot); */

      EduconnectResponse educonnectResponse =
          EduconnectResponse.fromCollection(querySnapshot);

/* 
      // Now you can work with the list of maps
      for (var map in dataList) {
        Madpoly.print('Document ID: ${map['id']}');
        Madpoly.print('Data: ${map['data']}');
      }*/
    } catch (e) {
      Madpoly.print('Error: $e');
    }
  }
}
 */