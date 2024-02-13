// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../classes/data/models/class_model.dart';
import '../../../../classes/logic/instructors_list_cubit/classes_list_cubit.dart';
import '../../../../dashboard/presentation/widgets/dashboard_drop_down_widget.dart';
import '../../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../user_details_form.dart';
import '../../../user_model.dart';
import '../../data/models/student_model.dart';
import '/common/madpoly.dart';

class StudentDetailsForm extends StatefulWidget {
  final StudentModel? currentStudentData;
  final Function(EduconnectModel model) onSaved;
  // final GlobalKey<FormState> formKey;
  const StudentDetailsForm({
    // required this.formKey,
    super.key,
    this.currentStudentData,
    required this.onSaved,
  });

  @override
  State<StudentDetailsForm> createState() => _StudentDetailsFormState();
}

class _StudentDetailsFormState extends State<StudentDetailsForm> {
  // Use Studentmodel to store form data
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _userFormKey = GlobalKey<FormState>();

  // StudentModel studentData = StudentModel.empty();
  StudentModel studentData = StudentModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentStudentData != null;
    if (editingModel) {
      studentData = widget.currentStudentData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UserDetailsForm(
            currentUserData: studentData,
            onSaved: onUserDataSaved,
            formKey: _userFormKey,
          ),

          /// class
          DashboardDropDownWidget<ClassesListCubit>(
              value: studentData.classModel.name,
              labelText: 'Class',
              onChanged: (EduconnectModel value) {
                Madpoly.print(
                  'class model = $value',
                  tag:
                      'student_details_form > DashboardDropDownWidget<ClassesListCubit>',
                  developer: "Ziad",
                );
                studentData =
                    studentData.copyWith(classModel: value as ClassModel);
                setState(() {});
              }),

          /// Payment Status
          //  Todo: create a ui to select student's payment status
          EduconnectTextField(
            initialValue: studentData.paymentStatus ? 'paid' : 'not paid',
            labelText: 'Specialization',
            validator: EduconnectValidations.nameValidator,
            /* onSaved: (value) {
              studentData = studentData.copyWith(paymentStatus: value);
              // setState(() {});
            }, */
          ),
          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
        ],
      ),
    );
  }

  onUserDataSaved(UserModel user) {
    studentData = studentData.copyFromUser(user);
  }

  onSubmitButtonPressed() {
    // if (_formKey.currentState!.validate() &&
    //     _userFormKey.currentState!.validate()) {
    _formKey.currentState!.save();
    _userFormKey.currentState!.save();

    widget.onSaved(studentData);
    // }
  }
}
