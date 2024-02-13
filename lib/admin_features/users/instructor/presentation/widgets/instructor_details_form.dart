import 'package:flutter/material.dart';

import '../../../../../common/comon_features/widgets/educonnect_date_field.dart';
import '../../../../../common/comon_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/functions/educonnect_date_time_helper.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/presentation/widgets/form_buttons_widget.dart';
import '../../../user_details_form.dart';
import '../../../user_model.dart';
import '../../data/models/instructor_model.dart';

class InstructorDetailsForm extends StatefulWidget {
  final InstructorModel? currentInstructorData;
  final Function(EduconnectModel model) onSaved;

  const InstructorDetailsForm(
      {super.key, this.currentInstructorData, required this.onSaved});

  @override
  State<InstructorDetailsForm> createState() => _InstructorDetailsFormState();
}

class _InstructorDetailsFormState extends State<InstructorDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _userFormKey = GlobalKey<FormState>();

  // Use Instructormodel to store form data
  InstructorModel instructorData = InstructorModel.dummy();
  bool editingModel = false;
  @override
  void initState() {
    super.initState();
    editingModel = widget.currentInstructorData != null;
    if (editingModel) {
      instructorData = widget.currentInstructorData!.copyWith();
    }
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'instructor_details_form.dart > build',
      developer: "Ziad",
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UserDetailsForm(
            currentUserData: instructorData,
            onSaved: onUserDataSaved,
            formKey: _userFormKey,
          ),

          /// specialization
          EduconnectTextField(
            initialValue: instructorData.specialization,
            labelText: 'Specialization',
            validator: EduconnectValidations.nameValidator,
            onSaved: (value) {
              instructorData = instructorData.copyWith(specialization: value);
              // setState(() {});
            },
          ),

          /// hireDate
          EduconnectDateField(
            initialValue:
                EduconnectDateTimeHelper.format(instructorData.dateOfBirth),
            labelText: 'Hire Date',
            onTap: (date) {
              instructorData = instructorData.copyWith(hireDate: date);
              setState(() {});
            },
          ),
          FormButtonsWidget(onSubmitButtonPressed: onSubmitButtonPressed),
        ],
      ),
    );
  }

  onUserDataSaved(UserModel user) {
    instructorData = instructorData.copyFromUser(user);
  }

  onSubmitButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.onSaved(instructorData);
    }
  }
}
