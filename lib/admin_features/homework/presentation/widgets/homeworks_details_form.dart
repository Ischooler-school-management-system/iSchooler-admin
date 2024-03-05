import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/common_features/widgets/fields/ischooler_text_field.dart';
import '../../../../../common/ischooler_validation.dart';
import '../../../../../common/madpoly.dart';
import '../../../../common/common_features/widgets/ischooler_drop_down_widget.dart';
import '../../../../common/ischooler_model.dart';
import '../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../instructor_assignments/data/models/instructor_assignment_model.dart';
import '../../../instructor_assignments/data/models/instructor_assignments_list_model.dart';
import '../../../instructor_assignments/logic/cubit/instructor_assignments_list_cubit.dart';
import '../../../users/instructor/data/models/instructor_model.dart';
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

  // Use HomeworkModel to store form data
  HomeworkModel homeworkData = HomeworkModel.dummy();
  bool isValidInstructor = false;
  bool editingModel = false;
  InstructorModel? selectedInstructor;
  String selectedClass = '';

  @override
  void initState() {
    super.initState();
    editingModel = widget.currentHomeworkData != null;
    if (editingModel) {
      homeworkData = widget.currentHomeworkData!.copyWith();
    }
    isValidInstructor = homeworkData.instructorAssignment.instructor == null ||
        homeworkData.instructorAssignment.instructor!.id == '-1';
    if (isValidInstructor) {
      context.read<InstructorAssignmentsListCubit>().getAllItems(eqMap: {
        'instructor_id': homeworkData.instructorAssignment.instructor!.id
      });
      selectedInstructor = homeworkData.instructorAssignment.instructor;
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
            initialValue: homeworkData.content,
            labelText: 'Homework Content',
            validator: IschoolerValidations.nameValidator,
            onSaved: (value) {
              setState(() {
                homeworkData = homeworkData.copyWith(name: value);
              });
            },
          ),
          DashboardDropDownWidget<InstructorsListCubit>(
              hint: isValidInstructor
                  ? 'Select Instructor'
                  : homeworkData.instructorAssignment.instructor!.name,
              labelText: 'Instructor',
              onChanged: (IschoolerModel value) {
                Madpoly.print(
                  'Instructor model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<InstructorsListCubit>',
                  developer: "Ziad",
                );
                if (value is InstructorModel) {
                  selectedInstructor = value;
                }
                // homeworkData.instructorAssignment = homeworkData
                //     .instructorAssignment
                //     .copyWith(instructor: value as InstructorModel);
                context
                    .read<InstructorAssignmentsListCubit>()
                    .getAllItems(eqMap: {'instructor_id': value.id});
                setState(() {});
              }),

          BlocBuilder<InstructorAssignmentsListCubit,
              InstructorAssignmentsListState>(
            builder: (context, state) {
              InstructorAssignmentsListModel ischoolerAllModel =
                  InstructorAssignmentsListModel.empty();
              if (state.isLoaded() &&
                  state.ischoolerAllModel is InstructorAssignmentsListModel) {
                ischoolerAllModel =
                    state.ischoolerAllModel as InstructorAssignmentsListModel;
              }
              List<String> classOptions = ischoolerAllModel.getItemClassName();
              List<String> subjectOptions =
                  ischoolerAllModel.getItemSubjectName();
              return Column(
                children: [
                  EduConnectDropdownWidget(
                    labelText: 'Class',
                    hint: classOptions.isEmpty
                        ? 'Select Class'
                        : classOptions.first,
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value != '') {
                          selectedClass = value;
                          // if (selectedData != null) {
                          //   // widget.onChanged(selectedData);
                          // }
                        }
                      });
                    },
                    options: classOptions,
                  ),
                  EduConnectDropdownWidget(
                    labelText: 'Subject',
                    hint: subjectOptions.isEmpty
                        ? 'Select Subject'
                        : subjectOptions.first,
                    onChanged: (selectedSubject) {
                      if (selectedSubject != null && selectedSubject != '') {
                        InstructorAssignmentModel? selectedData =
                            ischoolerAllModel.getModelByNames(
                          subjectName: selectedSubject,
                          className: selectedClass,
                          instructor: selectedInstructor,
                        );
                        print(
                            'InstructorAssignmentModel selectedData = $selectedData');
                        if (selectedData != null) {
                          homeworkData = homeworkData.copyWith(
                              instructorAssignmentModel: selectedData);
                        }
                      }
                      setState(() {});
                    },
                    options: subjectOptions,
                  ),
                ],
              );
            },
          ), // DashboardDropDownWidget<SubjectsListCubit>(
          //     hint: homeworkData.instructorAssignment.subjectModel == null
          //         ? ''
          //         : homeworkData.instructorAssignment.subjectModel!.name,
          //     labelText: 'Subject',
          //     onChanged: (IschoolerModel value) {
          //       Madpoly.print(
          //         'Subject model = $value',
          //         tag:
          //             'student_details_form > DashboardDropDownWidget<SubjectsListCubit>',
          //         developer: "Ziad",
          //       );
          //       // homeworkData.instructorAssignment = homeworkData
          //       //     .instructorAssignment
          //       //     .copyWith(subjectModel: value as SubjectModel);
          //       setState(() {});
          //     }),
          // DashboardDropDownWidget<ClassesListCubit>(
          //     hint: homeworkData.instructorAssignment.classModel == null
          //         ? ''
          //         : homeworkData.instructorAssignment.classModel!.name,
          //     labelText: 'Class',
          //     onChanged: (IschoolerModel value) {
          //       Madpoly.print(
          //         'Class Model = $value',
          //         tag:
          //             'student_details_form > DashboardDropDownWidget<ClassesListCubit>',
          //         developer: "Ziad",
          //       );
          //       // homeworkData.instructorAssignment = homeworkData
          //       //     .instructorAssignment
          //       //     .copyWith(classModel: value as ClassModel);
          //       setState(() {});
          //     }),
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
