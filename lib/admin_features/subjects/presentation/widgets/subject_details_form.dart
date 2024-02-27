import 'package:flutter/material.dart';
import 'package:ischooler_admin/admin_features/grades/data/models/grade_model.dart';

import '../../../../../common/common_features/widgets/fields/ischooler_text_field.dart';
import '../../../../../common/ischooler_model.dart';
import '../../../../../common/ischooler_validation.dart';
import '../../../../../common/madpoly.dart';
import '../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../grades/logic/cubit/grades_list_cubit.dart';
import '../../data/models/subject_model.dart';

class SubjectDetailsForm extends StatefulWidget {
  final SubjectModel? currentSubjectData;
  final Function(SubjectModel model) onSaved;

  const SubjectDetailsForm(
      {super.key, this.currentSubjectData, required this.onSaved});

  @override
  State<SubjectDetailsForm> createState() => _SubjectDetailsFormState();
}

class _SubjectDetailsFormState extends State<SubjectDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  // Use Subjectmodel to store form data
  SubjectModel subjectData = SubjectModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentSubjectData != null;
    if (editingModel) {
      subjectData = widget.currentSubjectData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'subject_details_form.dart > build',
      developer: "Ziad",
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (editingModel)
            IschoolerTextField(
              initialValue: subjectData.id,
              labelText: 'Subject ID',
              enabled: false,
            ),
          IschoolerTextField(
            initialValue: subjectData.name,
            labelText: 'Subject Name',
            validator: IschoolerValidations.nameValidator,
            onSaved: (value) {
              setState(() {
                subjectData = subjectData.copyWith(name: value);
              });
            },
          ),
          DashboardDropDownWidget<GradesListCubit>(
              hint: subjectData.grade.name,
              labelText: 'Grade',
              onChanged: (IschoolerModel value) {
                Madpoly.print(
                  'Grade model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<GradesListCubit>',
                  developer: "Ziad",
                );
                subjectData = subjectData.copyWith(grade: value as GradeModel);
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

      widget.onSaved(subjectData);
    }
  }
}
