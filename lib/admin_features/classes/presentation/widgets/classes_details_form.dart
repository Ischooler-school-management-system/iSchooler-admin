import 'package:flutter/material.dart';
import 'package:school_admin/admin_features/grades/data/models/grade_model.dart';
import 'package:school_admin/admin_features/weekly_timetable/presentation/screens/time_table_screen.dart';
import 'package:school_admin/common/comon_features/widgets/buttons/educonnect_button.dart';
import 'package:school_admin/common/comon_features/widgets/buttons/models/buttons_model.dart';
import 'package:school_admin/common/navigation/educonnect_navi.dart';

import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/madpoly.dart';
import '../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../grades/logic/cubit/grades_list_cubit.dart';
import '../../data/models/class_model.dart';

class ClassDetailsForm extends StatefulWidget {
  final ClassModel? currentClassData;
  final Function(ClassModel model) onSaved;

  const ClassDetailsForm(
      {super.key, this.currentClassData, required this.onSaved});

  @override
  State<ClassDetailsForm> createState() => _ClassDetailsFormState();
}

class _ClassDetailsFormState extends State<ClassDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  // Use Classmodel to store form data
  ClassModel classData = ClassModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentClassData != null;
    if (editingModel) {
      classData = widget.currentClassData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'class_details_form.dart > build',
      developer: "Ziad",
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EduconnectButton(
            button: EduconnectElevatedButton(
              onPressed: () {
                EduconnectNavigator.navigateToScreen(
                    TimeTableScreen(classId: classData.id));
              },
              text: 'class time table',
            ),
          ),
          EduconnectTextField(
            initialValue: classData.id,
            labelText: 'Class ID',
          ),
          EduconnectTextField(
            initialValue: classData.name,
            labelText: 'Class Name',
            validator: EduconnectValidations.nameValidator,
            onSaved: (value) {
              setState(() {
                classData = classData.copyWith(name: value);
              });
            },
          ),
          DashboardDropDownWidget<GradesListCubit>(
              hint: classData.grade.name,
              labelText: 'Grade',
              onChanged: (EduconnectModel value) {
                Madpoly.print(
                  'Grade model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<GradesListCubit>',
                  developer: "Ziad",
                );
                classData = classData.copyWith(grade: value as GradeModel);
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

      widget.onSaved(classData);
    }
  }
}
