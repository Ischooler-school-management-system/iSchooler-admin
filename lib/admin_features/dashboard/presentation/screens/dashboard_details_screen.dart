// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../classes/data/models/class_model.dart';
import '../../../classes/logic/instructors_list_cubit/classes_list_cubit.dart';
import '../../../classes/presentation/widgets/classes_details_form.dart';
import '../../../dashboard/logic/cubit/all_cubit.dart';
import '../../../grades/data/models/grade_model.dart';
import '../../../grades/logic/instructors_list_cubit/grades_list_cubit.dart';
import '../../../grades/presentation/widgets/grade_details_form.dart';
import '../../../users/admins/data/models/admin_model.dart';
import '../../../users/admins/logic/admins_list_cubit/admins_list_cubit.dart';
import '../../../users/admins/presentation/widgets/admin_details_form.dart';
import '../../../users/instructor/data/models/instructor_model.dart';
import '../../../users/instructor/logic/instructors_list_cubit/instructors_list_cubit.dart';
import '../../../users/instructor/presentation/widgets/instructor_details_form.dart';
import '../../../users/students/data/models/student_model.dart';
import '../../../users/students/logic/students_list_cubit/students_list_cubit.dart';
import '../../../users/students/presentation/widgets/student_details_form.dart';
import '/common/comon_features/widgets/educonnect_screen.dart';
import '/common/comon_features/widgets/educonnect_small_view.dart';
import '/common/educonnect_model.dart';
import '/common/madpoly.dart';

class DashboardDetailsScreen<C extends EduconnectCubit> extends StatefulWidget {
  final EduconnectModel? currentData;
  const DashboardDetailsScreen({super.key, this.currentData});

  @override
  State<DashboardDetailsScreen<C>> createState() =>
      _DashboardDetailsScreenState<C>();
}

class _DashboardDetailsScreenState<C extends EduconnectCubit>
    extends State<DashboardDetailsScreen<C>> {
// final _formKey = GlobalKey<FormState>();

  // Use Studentmodel to store form data
  EduconnectModel data = EduconnectModel.empty();
  bool editingMode = false;
  @override
  void initState() {
    super.initState();
    editingMode = widget.currentData != null;
    if (editingMode) {
      data = widget.currentData!.copyWith();
    }
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
    } else if (C == ClassesListCubit) {
      return ClassDetailsForm(
        currentClassData: widget.currentData as ClassModel?,
        onSaved: onSubmitButtonPressed,
      );
    } else if (C == GradesListCubit) {
      return GradeDetailsForm(
        currentGradeData: widget.currentData as GradeModel?,
        onSaved: onSubmitButtonPressed,
      );
    } else {
      return Center(child: Text('$C not found'));
    }
  }

  onSubmitButtonPressed(EduconnectModel data) {
    Madpoly.print(' model after form submit: ',
        inspectObject: data,
        tag: 'dashboard_details_screen > onSubmitButtonPressed');
    if (editingMode) {
      context.read<C>().updateItem(model: data);
    } else {
      context.read<C>().addItem(model: data);
    }
  }
}
