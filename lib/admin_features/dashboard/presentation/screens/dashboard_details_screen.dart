// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_admin/admin_features/dashboard/logic/cubit/all_cubit.dart';
import 'package:school_admin/admin_features/users/instructor/presentation/widgets/instructor_details_form.dart';
import 'package:school_admin/admin_features/users/students/data/models/student_model.dart';
import 'package:school_admin/admin_features/users/students/logic/students_list_cubit/students_list_cubit.dart';
import 'package:school_admin/admin_features/users/students/presentation/widgets/student_details_form.dart';
import 'package:school_admin/common/comon_features/widgets/educonnect_screen.dart';
import 'package:school_admin/common/comon_features/widgets/educonnect_small_view.dart';
import 'package:school_admin/common/educonnect_model.dart';
import 'package:school_admin/common/madpoly.dart';

import '../../../users/admins/data/models/admin_model.dart';
import '../../../users/admins/logic/admins_list_cubit/admins_list_cubit.dart';
import '../../../users/admins/presentation/widgets/admin_details_form.dart';
import '../../../users/instructor/data/models/instructor_model.dart';
import '../../../users/instructor/logic/instructors_list_cubit/instructors_list_cubit.dart';

class DashboardDetailsScreen<C extends EduconnectCubit> extends StatefulWidget {
  final EduconnectModel? currentData;
  const DashboardDetailsScreen({super.key, this.currentData});

  @override
  State<DashboardDetailsScreen<C>> createState() =>
      _DashboardDetailsScreenState<C>();
}

class _DashboardDetailsScreenState<C extends EduconnectCubit>
    extends State<DashboardDetailsScreen<C>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EduconnectBoxConstrain(
      padding: const EdgeInsets.all(30.0),
      maxWidth: 500,
      child: EduconnectScreen(
        padding: const EdgeInsets.all(30.0),
        enableScrolling: true,
        body: form(),
      ),
    );
  }

  Widget form() {
    if (C == StudentsListCubit) {
      return StudentDetailsForm(
        currentStudentData: widget.currentData as StudentModel?,
        onSaved: onSubmitButtonPressed,
      );
    } else if (C == AdminsListCubit) {
      return AdminDetailsForm(
        currentAdminData: widget.currentData as AdminModel?,
        onSaved: onSubmitButtonPressed,
      );
    } else if (C == InstructorsListCubit) {
      return InstructorDetailsForm(
        currentInstructorData: widget.currentData as InstructorModel?,
        onSaved: onSubmitButtonPressed,
      );
    } else {
      return Center(child: Text('$C not found'));
    }
  }

  onSubmitButtonPressed(EduconnectModel data) {
    Madpoly.print('User Data: $data');
    context.read<C>().addItem(model: data);
  }
}