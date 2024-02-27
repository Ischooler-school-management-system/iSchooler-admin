import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/logic/cubit/auth_cubit.dart';

import '../../../../common/common_features/widgets/buttons/educonnect_button.dart';
import '../../../../common/common_features/widgets/buttons/models/buttons_model.dart';
import '../../../../common/common_features/widgets/educonnect_screen.dart';
import '../../../../common/educonnect_constants.dart';
import '../../../../common/navigation/router.export.dart';
import '../../../../common/style/educonnect_colors.dart';
import '../../data/models/student_model.dart';
import '../widgets/profile_details_widget.dart';
import '../widgets/profile_overview_widget.dart';

class ProfileScreen extends StatelessWidget {
  final StudentModel studentData;
  const ProfileScreen({super.key, required this.studentData});

  @override
  Widget build(BuildContext context) {
    return IschoolerScreen(
        appBar: AppBar(
          backgroundColor: IschoolerColors.blue,
          foregroundColor: IschoolerColors.white,
          title: Text(
            IschoolerConstants.localization().profile,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: IschoolerButton(
            button: IschoolerIconButton(
              onPressed: () {
                IschoolerNavigator.push(
                  Routes.settingsScreen,
                  // replace: true,
                );
              },
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ),
          actions: [
            IschoolerButton(
              button: IschoolerIconButton(
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                },
                icon: const Icon(
                  Icons.logout,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileOverviewWidget(studentData: studentData),
            ProfileDetailsWidget(studentData: studentData),
          ],
        ));
  }
}
