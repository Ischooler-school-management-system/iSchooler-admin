import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/common_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/madpoly.dart';
import '../../../../common/common_features/widgets/educonnect_screen.dart';
import '../../../../common/common_features/widgets/educonnect_time_field.dart';
import '../../../../common/educonnect_model.dart';
import '../../../classes/data/models/class_model.dart';
import '../../../classes/logic/cubit/classes_list_cubit.dart';
import '../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../data/models/weekly_timetable_model.dart';
import '../../logic/cubit/weekly_timetable_cubit.dart';

class TimeTableDetailsForm extends StatefulWidget {
  final ClassModel currentClassData;
  final WeeklyTimetableModel? currentTimeTableData;

  const TimeTableDetailsForm({
    super.key,
    required this.currentClassData,
    this.currentTimeTableData,
  });

  @override
  State<TimeTableDetailsForm> createState() => _TimeTableDetailsFormState();
}

class _TimeTableDetailsFormState extends State<TimeTableDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  WeeklyTimetableModel timeTableData = WeeklyTimetableModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentTimeTableData != null;
    if (editingModel) {
      timeTableData = widget.currentTimeTableData!.copyWith();
    } else {
      timeTableData =
          timeTableData.copyWith(classId: widget.currentClassData.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'class_details_form.dart > build',
      developer: "Ziad",
    );
    return IschoolerScreen(
      enableScrolling: true,
      showAppbar: true,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            if (editingModel)
              IschoolerTextField(
                initialValue: timeTableData.id,
                labelText: ' TimeTable ID',
                enabled: false,
              ),
            IschoolerTextField(
              initialValue: timeTableData.name,
              labelText: 'TimeTable Name',
              validator: IschoolerValidations.nameValidator,
              onSaved: (value) {
                setState(() {
                  timeTableData = timeTableData.copyWith(name: value);
                });
              },
            ),
            IschoolerTextField(
              initialValue: timeTableData.name,
              labelText: 'term',
              validator: IschoolerValidations.nameValidator,
              onSaved: (value) {
                setState(() {
                  timeTableData = timeTableData.copyWith(term: value);
                });
              },
            ),

            /// class
            DashboardDropDownWidget<ClassesListCubit>(
                hint: widget.currentClassData.name,
                labelText: 'Class',
                onChanged: (IschoolerModel value) {
                  Madpoly.print(
                    'class model = $value',
                    tag:
                        'student_details_form > DashboardDropDownWidget<ClassesListCubit>',
                    developer: "Ziad",
                  );
                  timeTableData =
                      timeTableData.copyWith(classModel: value as ClassModel);
                  setState(() {});
                }),
            IschoolerTimeField(
              onTap: (DateTime value) {
                timeTableData = timeTableData.copyWith(startTime: value);
                setState(() {});
              },
              labelText: 'Start time',
              initialValue: const TimeOfDay(hour: 8, minute: 0),
            ),
            IschoolerTimeField(
              onTap: (DateTime value) {
                timeTableData = timeTableData.copyWith(endTime: value);
                setState(() {});
              },
              labelText: 'end time',
              initialValue: const TimeOfDay(hour: 14, minute: 0),
            ),
            IschoolerTextField(
              // initialValue: '01111',
              initialValue: timeTableData.sessionInterval.toString(),
              keyboardType: TextInputType.number,
              labelText: 'Session Interval',
              validator: (value) {
                // Add phone number validation if needed
                return null;
              },
              onSaved: (value) {
                timeTableData = timeTableData.copyWith(
                    sessionInterval: value == null ? 0 : int.parse(value));
                // setState(() {});
              },
            ),
            IschoolerTextField(
              // initialValue: '01111',
              initialValue: timeTableData.breakInterval.toString(),
              keyboardType: TextInputType.number,

              labelText: 'Break Interval',
              validator: (value) {
                // Add phone number validation if needed
                return null;
              },
              onSaved: (value) {
                timeTableData = timeTableData.copyWith(
                    breakInterval: value == null ? 0 : int.parse(value));
                // setState(() {});
              },
            ),
            FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
          ],
        ),
      ),
    );
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (editingModel) {
        context.read<WeeklyTimetableCubit>().updateItem(model: timeTableData);
      } else {
        context.read<WeeklyTimetableCubit>().addItem(model: timeTableData);
      }
      // widget.onSaved(timeTableData);
    }
  }
}
