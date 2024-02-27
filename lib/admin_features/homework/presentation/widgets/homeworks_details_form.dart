import 'package:flutter/material.dart';

import '../../../../../common/common_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/madpoly.dart';
import '../../../../common/educonnect_model.dart';
import '../../../classes/logic/cubit/classes_list_cubit.dart';
import '../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../subjects/logic/cubit/subjects_list_cubit.dart';
import '../../../users/instructor/logic/cubit/instructors_list_cubit.dart';
import '../../data/models/homework_model.dart';

class HomeworkDetailsForm extends StatefulWidget {
  final HomeworkModel? currentHomeworkData;
  final Function(HomeworkModel model) onSaved;

  const HomeworkDetailsForm(
      {super.key, this.currentHomeworkData, required this.onSaved});

  @override
  State<HomeworkDetailsForm> createState() => _HomeworkDetailsFormState();
}

class _HomeworkDetailsFormState extends State<HomeworkDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  // Use Homeworkmodel to store form data
  HomeworkModel homeworkData = HomeworkModel.dummy();

  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentHomeworkData != null;
    if (editingModel) {
      homeworkData = widget.currentHomeworkData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'homework_details_form.dart > build',
      developer: "Ziad",
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (editingModel)
            IschoolerTextField(
              initialValue: homeworkData.id,
              labelText: 'Homework ID',
              enabled: false,
            ),
          IschoolerTextField(
            initialValue: homeworkData.name,
            labelText: 'Homework Name',
            validator: IschoolerValidations.nameValidator,
            onSaved: (value) {
              setState(() {
                homeworkData = homeworkData.copyWith(name: value);
              });
            },
          ),
          DashboardDropDownWidget<InstructorsListCubit>(
              hint: homeworkData.instructorAssignment.instructor == null
                  ? ''
                  : homeworkData.instructorAssignment.instructor!.name,
              labelText: 'Instructor',
              onChanged: (IschoolerModel value) {
                Madpoly.print(
                  'Instructor model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<InstructorsListCubit>',
                  developer: "Ziad",
                );
                // homeworkData.instructorAssignment = homeworkData
                //     .instructorAssignment
                //     .copyWith(instructor: value as InstructorModel);
                setState(() {});
              }),
          DashboardDropDownWidget<SubjectsListCubit>(
              hint: homeworkData.instructorAssignment.subjectModel == null
                  ? ''
                  : homeworkData.instructorAssignment.subjectModel!.name,
              labelText: 'Subject',
              onChanged: (IschoolerModel value) {
                Madpoly.print(
                  'Subject model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<SubjectsListCubit>',
                  developer: "Ziad",
                );
                // homeworkData.instructorAssignment = homeworkData
                //     .instructorAssignment
                //     .copyWith(subjectModel: value as SubjectModel);
                setState(() {});
              }),
          DashboardDropDownWidget<ClassesListCubit>(
              hint: homeworkData.instructorAssignment.classModel == null
                  ? ''
                  : homeworkData.instructorAssignment.classModel!.name,
              labelText: 'Class',
              onChanged: (IschoolerModel value) {
                Madpoly.print(
                  'Class Model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<ClassesListCubit>',
                  developer: "Ziad",
                );
                // homeworkData.instructorAssignment = homeworkData
                //     .instructorAssignment
                //     .copyWith(classModel: value as ClassModel);
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

      widget.onSaved(homeworkData);
    }
  }
}
