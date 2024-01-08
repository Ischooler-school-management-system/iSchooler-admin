import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/educonnect_assets.dart';
import '../../common/features/responsive/responsive.dart';
import '../../common/features/widgets/buttons/educonnect_button.dart';
import '../../common/features/widgets/buttons/models/buttons_model.dart';
import '../../common/features/widgets/educonnect_conditional_widget.dart';
import '../../common/features/widgets/educonnect_image_widget.dart';
import '../../common/features/widgets/educonnect_screen.dart';
import '../../common/style/educonnect_colors.dart';
import '../../common/style/educonnect_text_theme.dart';
import 'students/data/models/student_model.dart';
import 'students/logic/cubit/students_cubit.dart';

class StudentsTab extends StatefulWidget {
  const StudentsTab({super.key});

  @override
  State<StudentsTab> createState() => _StudentsTabState();
}

class _StudentsTabState extends State<StudentsTab> {
  List<StudentModel> userList = [
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
    StudentModel(
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
  ];
  int limit = 0;

  onAddButtonPressed() {
    // StudentModel newUser =
    // EduconnectNavigator.navigateToScreen(const AddStudentScreen());
    context.read<StudentCubit>().storeStudentData(
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
    // userList.add(newUser);
    // setState(() {});
  }

  EduconnectButton addButton() {
    return EduconnectButton(
      button: EduconnectElevatedButton(
        onPressed: onAddButtonPressed,
        text: 'Add User',
        width: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      enableflexibleScrolling: true,
      padding: const EdgeInsets.all(8),
      body: EduconnectConditionalWidget(
        condition: Responsive.isMobile(),
        whenTrue: listTileVeiw(),
        whenFalse: webView(),
      ),
    );
  }

  Widget listTileVeiw() {
    limit = StudentModel.empty().toDisplayMap().length;
    if (Responsive.isCustomWidth(width: 1200) && limit >= 8) {
      limit -= 2;
    } else if (Responsive.isCustomWidth(width: 1000) && limit >= 6) {
      limit -= 2;
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      addButton(),
      ...userList.map((user) {
        return userListTile(
          title: user.displayName,
          isName: true,
          subtitle: '${user.gender} | ${user.phoneNumber}',
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Handle edit button press
                  print('Edit button pressed for Item ');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  // Handle delete button press
                  print('Delete button pressed for Item ');
                },
              ),
            ],
          ),
        );
      }),
    ]);
  }

  Widget webView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addButton(),
        // EduconnectConditionalWidget(
        // condition: Responsive.isMobile(),
        // whenTrue: listTileVeiw(),
        _valuesRow(
          map: StudentModel.empty().toDisplayMap(limit: limit),
          isEven: false,
          viewKeys: true,
        ),
        // Column(
        ...userList.asMap().entries.map(
          (entry) {
            final StudentModel user = entry.value;
            final index = entry.key;
            final isEven = index % 2 == 0;
            // return _valueTextWidget(propertyName, isEven: isEven);

            return _valuesRow(
                map: user.toDisplayMap(limit: limit), isEven: isEven);
          },
        ),
        // ),
        // ),
      ],
    );
  }

  Widget _valuesRow(
      {required Map map, required bool isEven, bool viewKeys = false}) {
    return Container(
      color: isEven ? EduconnectColors.blue.withOpacity(0.3) : null,
      // padding: const EdgeInsets.all(8.0),
      child: Row(
        children: map.entries.map((MapEntry entry) {
          if (viewKeys) {
            return userListTile(title: entry.key, width: 150);
          } else {
            return userListTile(
              title: entry.value.toString(),
              isName: entry.key == 'displayName',
              width: 150,
            );
          }
        }).toList(),
      ),
    );
  }

  Widget userListTile({
    bool isName = false,
    required String title,
    String? subtitle,
    Widget? trailing,
    Function()? onTap,
    double? width,
  }) {
    return Flexible(
      // width: width,
      child: ListTile(
        // titleAlignment: ListTileTitleAlignment.top,
        leading: isName
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: EduconnectImageWidget.asset(
                  url: EduconnectAssets.blankProfileImage,
                  circleShape: true,
                ),
              )
            : null,
        title: Text(
          title,
          style: EduconnectTextStyles.style14,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                // style: EduconnectTextStyles.style14,
                textAlign: TextAlign.center,
              )
            : null,
        onTap: onTap,
        trailing: trailing,
      ),
    );
  }
}
