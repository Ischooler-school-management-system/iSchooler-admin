import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_admin/common/navigation/educonnect_navi.dart';

import 'common/features/widgets/buttons/educonnect_button.dart';
import 'common/features/widgets/buttons/models/buttons_model.dart';
import 'common/features/widgets/educonnect_screen.dart';
import 'features/auth/logic/cubit/auth_cubit.dart';
import 'features/users/admins/data/models/admin_model.dart';
import 'features/users/students/data/models/student_model.dart';

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
                onPressed: _onPressedAdminSignup,
                text: 'admin signup',
              ),
            ),
            EduconnectButton(
              button: EduconnectElevatedButton(
                onPressed: _onPressedAdminSignin,
                text: 'admin signin',
              ),
            ),
            EduconnectButton(
              button: EduconnectElevatedButton(
                onPressed: _onPressedStudentSignup,
                text: 'student signup',
              ),
            ),
            EduconnectButton(
              button: EduconnectElevatedButton(
                onPressed: _onPressedStudentSignin,
                text: 'student signin',
              ),
            ),
          ],
        ));
  }

  void _onPressedAdminSignup() {
    currentContext!.read<AuthCubit>().signUp(
          user: AdminModel(
            id: '123',
            displayName: 'ZH',
            userName: 'Ziad Hesham',
            dateOfBirth: DateTime(2000, 1, 1),
            phoneNumber: '1234567890',
            address: '123 Main St',
            gender: 'Male',
            email: 'ziad@admin.com',
          ),
          password: 'password',
        );
  }

  void _onPressedAdminSignin() {}

  void _onPressedStudentSignup() {
    currentContext!.read<AuthCubit>().signUp(
          user: StudentModel(
            id: '123',
            displayName: 'ZH',
            userName: 'Ziad Hesham',
            dateOfBirth: DateTime(2000, 1, 1),
            phoneNumber: '1234567890',
            address: '123 Main St',
            gender: 'Male',
            email: 'ziad@student.com',
          ),
          password: 'password',
        );
  }

  void _onPressedStudentSignin() {}
}
