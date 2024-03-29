import 'package:flutter/material.dart';

import '../../../../../common/common_features/widgets/fields/ischooler_text_field.dart';
import '../../../../../common/ischooler_model.dart';
import '../../../../../common/ischooler_validation.dart';
import '../../../../../common/madpoly.dart';
import '../../../cubits.dart';
import '../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../models.dart';

class InstructorAssignmentDetailsForm extends StatefulWidget {
  final InstructorAssignmentModel? currentInstructorAssignmentData;
  final Function(InstructorAssignmentModel model) onSaved;

  const InstructorAssignmentDetailsForm(
      {super.key, this.currentInstructorAssignmentData, required this.onSaved});

  @override
  State<InstructorAssignmentDetailsForm> createState() =>
      _InstructorAssignmentDetailsFormState();
}

class _InstructorAssignmentDetailsFormState
    extends State<InstructorAssignmentDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  // Use InstructorAssignmentmodel to store form data
  InstructorAssignmentModel instructorAssignmentData =
      InstructorAssignmentModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentInstructorAssignmentData != null;
    if (editingModel) {
      instructorAssignmentData =
          widget.currentInstructorAssignmentData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'instructorassignment_details_form.dart > build',
      developer: "Ziad",
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (editingModel)
            IschoolerTextField(
              initialValue: instructorAssignmentData.id,
              labelText: 'InstructorAssignment ID',
              enabled: false,
            ),
          IschoolerTextField(
            initialValue: instructorAssignmentData.name,
            labelText: 'InstructorAssignment Name',
            validator: IschoolerValidations.nameValidator,
            onSaved: (value) {
              setState(() {
                instructorAssignmentData =
                    instructorAssignmentData.copyWith(name: value);
              });
            },
          ),
          DashboardDropDownWidget<InstructorsListCubit>(
              hint: instructorAssignmentData.instructor == null
                  ? ''
                  : instructorAssignmentData.instructor!.name,
              labelText: 'Instructor',
              onChanged: (IschoolerModel value) {
                Madpoly.print(
                  'Instructor model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<InstructorsListCubit>',
                  developer: "Ziad",
                );
                instructorAssignmentData = instructorAssignmentData.copyWith(
                    instructor: value as InstructorModel);
                setState(() {});
              }),
          DashboardDropDownWidget<SubjectsListCubit>(
              hint: instructorAssignmentData.subjectModel == null
                  ? ''
                  : instructorAssignmentData.subjectModel!.name,
              labelText: 'Subject',
              onChanged: (IschoolerModel value) {
                Madpoly.print(
                  'Subject model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<SubjectsListCubit>',
                  developer: "Ziad",
                );
                instructorAssignmentData = instructorAssignmentData.copyWith(
                    subjectModel: value as SubjectModel);
                setState(() {});
              }),
          DashboardDropDownWidget<ClassesListCubit>(
              hint: instructorAssignmentData.classModel == null
                  ? ''
                  : instructorAssignmentData.classModel!.name,
              labelText: 'Class',
              onChanged: (IschoolerModel value) {
                Madpoly.print(
                  'Class Model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<ClassesListCubit>',
                  developer: "Ziad",
                );
                instructorAssignmentData = instructorAssignmentData.copyWith(
                    classModel: value as ClassModel);
                setState(() {});
              }),
          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
        ],
      ),
    );
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSaved(instructorAssignmentData);
    }
  }
}
