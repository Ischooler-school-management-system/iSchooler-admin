import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../common/comon_features/responsive/responsive.dart';
import '../../../../../common/comon_features/widgets/buttons/educonnect_button.dart';
import '../../../../../common/comon_features/widgets/buttons/models/buttons_model.dart';
import '../../../../../common/comon_features/widgets/educonnect_conditional_widget.dart';
import '../../../../../common/comon_features/widgets/educonnect_screen.dart';
import '../../../all_users_web_veiw.dart';
import '../../data/models/all_students_model.dart';
import '../../data/models/student_model.dart';
import '../../logic/all_students_cubit/all_students_cubit.dart';
import 'all_studdents_views/all_students_mobile_veiw.dart';
import 'student_details_screen.dart';

class AllStudentsScreen extends StatefulWidget {
  const AllStudentsScreen({super.key});

  @override
  State<AllStudentsScreen> createState() => _AllStudentsScreenState();
}

class _AllStudentsScreenState extends State<AllStudentsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AllStudentsCubit>().getAllStudentsData();
  }

  var studentModel = StudentModel(
    id: '123',
    displayName: 'Joe',
    userName: 'JohnDoe',
    dateOfBirth: DateTime(2000, 1, 1),
    classId: '101',
    gradeId: 'A',
    phoneNumber: '1234567890',
    address: '123 Main St',
    paymentStatus: true,
    gender: 'Male',
    email: 'ziad@mail.com',
  );

  int limit = 0;

  onAddButtonPressed() {
    // StudentModel newStudent =
    // EduconnectNavigator.navigateToScreen(const AddStudentScreen());
    /*  context.read<AllStudentsCubit>().addStudent(
          student: studentModel,
        );
 */
    // studentList.add(newStudent);
    // setState(() {});
    // EduconnectNavigator.push(Routes.studentDetailsScreen);
    SmartDialog.show(
      alignment: Alignment.center,
      builder: (context) => const StudentDetailsScreen(),
    );
  }

  EduconnectButton addButton() {
    return EduconnectButton(
      button: EduconnectElevatedButton(
        onPressed: onAddButtonPressed,
        text: 'Add Student',
        width: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      enableScrolling: Responsive.isMobile(),
      // enableflexibleScrolling: true,

      padding: const EdgeInsets.all(8),
      body: BlocBuilder<AllStudentsCubit, AllStudentsState>(
        builder: (context, state) {
          AllStudentsModel allStudentsModel = AllStudentsModel.empty();
          // AllStudentsModel allStudentsModel = AllStudentsModel(
          // items: List.generate(20, (index) => studentModel));
          if (state.isLoaded()) {
            allStudentsModel = state.allstudentsModel;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addButton(),
              Expanded(
                child: EduconnectConditionalWidget(
                  condition: Responsive.isMobile(),
                  whenTrue: AllStudentsMobileVeiw(
                      studentList: allStudentsModel.items),
                  whenFalse: AllUsersWebVeiw(
                    allUsers: allStudentsModel,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
