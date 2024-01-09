import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/features/responsive/responsive.dart';
import '../../../../../common/features/widgets/buttons/educonnect_button.dart';
import '../../../../../common/features/widgets/buttons/models/buttons_model.dart';
import '../../../../../common/features/widgets/educonnect_conditional_widget.dart';
import '../../../../../common/features/widgets/educonnect_screen.dart';
import '../../data/models/all_students_model.dart';
import '../../data/models/student_model.dart';
import '../../logic/all_students_cubit/all_students_cubit.dart';
import 'all_studdents_views/all_students_mobile_veiw.dart';
import 'all_studdents_views/all_students_web_veiw.dart';

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

  int limit = 0;

  onAddButtonPressed() {
    // StudentModel newStudent =
    // EduconnectNavigator.navigateToScreen(const AddStudentScreen());
    context.read<AllStudentsCubit>().addStudent(
          student: StudentModel(
            id: '123',
            displayName: 'Joe',
            studentName: 'JohnDoe',
            dateOfBirth: DateTime(2000, 1, 1),
            classId: '101',
            gradeId: 'A',
            phoneNumber: '1234567890',
            address: '123 Main St',
            paymentStatus: true,
            gender: 'Male',
            email: 'ziad@mail.com',
          ),
        );
    // studentList.add(newStudent);
    // setState(() {});
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
      enableflexibleScrolling: true,
      padding: const EdgeInsets.all(8),
      body: BlocBuilder<AllStudentsCubit, AllStudentsState>(
        builder: (context, state) {
          AllStudentsModel allStudentsModel = AllStudentsModel.empty();
          List<StudentModel> studentList = [];
          if (state.isLoaded()) {
            allStudentsModel = state.allstudentsModel;
            studentList = allStudentsModel.items;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addButton(),
              EduconnectConditionalWidget(
                condition: Responsive.isMobile(),
                whenTrue: AllStudentsMobileVeiw(studentList: studentList),
                whenFalse: AllStudentsWebVeiw(studentList: studentList),
              ),
            ],
          );
        },
      ),
    );
  }
}
