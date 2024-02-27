// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ischooler_admin/admin_features/forms.dart';

import '../../../cubits.dart';
import '../../../homework/data/models/homework_model.dart';
import '../../../homework/logic/cubit/homeworks_list_cubit.dart';
import '../../../homework/presentation/widgets/homeworks_details_form.dart';
import '../../../models.dart';
import '/common/common_features/widgets/educonnect_screen.dart';
import '/common/common_features/widgets/educonnect_small_view.dart';
import '/common/educonnect_model.dart';
import '/common/madpoly.dart';

class DashboardDetailsScreen<C extends IschoolerCubit> extends StatefulWidget {
  final IschoolerModel? currentData;
  const DashboardDetailsScreen({super.key, this.currentData});

  @override
  State<DashboardDetailsScreen<C>> createState() =>
      _DashboardDetailsScreenState<C>();
}

class _DashboardDetailsScreenState<C extends IschoolerCubit>
    extends State<DashboardDetailsScreen<C>> {
// final _formKey = GlobalKey<FormState>();

  // Use Studentmodel to store form data
  IschoolerModel data = IschoolerModel.empty();
  bool editingMode = false;
  @override
  void initState() {
    super.initState();
    editingMode = widget.currentData != null;
    if (editingMode) {
      data = widget.currentData!.copyWith();
    }
    Madpoly.print(
      'data = ',
      inspectObject: data,
      tag: 'dashboard_details_screen > track',
      developer: "Ziad",
    );
  }

  @override
  Widget build(BuildContext context) {
    return IschoolerScreen(
      showAppbar: true,
      padding: const EdgeInsets.all(30.0),
      enableScrolling: true,
      body: IschoolerBoxConstrain(
        // padding: const EdgeInsets.all(30.0),
        maxWidth: 600,
        child: form(),
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
    } else if (C == AdminRolesListCubit) {
      return AdminRoleDetailsForm(
        currentAdminRoleData: widget.currentData as AdminRoleModel?,
        onSaved: onSubmitButtonPressed,
      );
    } else if (C == InstructorsListCubit) {
      return InstructorDetailsForm(
        currentInstructorData: widget.currentData as InstructorModel?,
        onSaved: onSubmitButtonPressed,
      );
    } else if (C == InstructorAssignmentsListCubit) {
      return InstructorAssignmentDetailsForm(
        currentInstructorAssignmentData:
            widget.currentData as InstructorAssignmentModel?,
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
    } else if (C == SubjectsListCubit) {
      return SubjectDetailsForm(
        currentSubjectData: widget.currentData as SubjectModel?,
        onSaved: onSubmitButtonPressed,
      );
    } else if (C == HomeworksListCubit) {
      return HomeworkDetailsForm(
        currentHomeworkData: widget.currentData as HomeworkModel?,
        onSaved: onSubmitButtonPressed,
      );
    } else {
      return Center(child: Text('$C not found'));
    }
  }

  onSubmitButtonPressed(IschoolerModel data) {
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
