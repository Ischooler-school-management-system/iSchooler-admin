import 'package:flutter/material.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/features/widgets/fields/educonnect_text_field.dart';

class SignupForm extends StatefulWidget {
  final Function(bool) onIsKeyboardStatusChanged;
  final Function(bool isButtonDisabled) onFormChanged;

  const SignupForm(
      {super.key,
      required this.onIsKeyboardStatusChanged,
      required this.onFormChanged});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isKeyboardOpen = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  bool _isButtonDisabled = true;

  void _updateIsKeyboardOpen(bool newValue) {
    widget.onIsKeyboardStatusChanged(newValue);
  }

  @override
  void initState() {
    super.initState();

    emailFocusNode.addListener(() {
      _updateIsKeyboardOpen(emailFocusNode.hasFocus);
    });

    nameFocusNode.addListener(() {
      _updateIsKeyboardOpen(nameFocusNode.hasFocus);
    });

    phoneFocusNode.addListener(() {
      _updateIsKeyboardOpen(phoneFocusNode.hasFocus);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        setState(() {
          _isButtonDisabled = !_formKey.currentState!.validate();
          widget.onFormChanged(_isButtonDisabled);
        });
      },
      child: Column(
        children: [
          EduconnectTextField(
            labelText: EduconnectConstants.localization().enter_name,
            focusNode: nameFocusNode,
            validator: EduconnectValidations.nameValidator,
          ),
          EduconnectTextField(
            labelText: EduconnectConstants.localization().enter_email,
            focusNode: emailFocusNode,
            validator: EduconnectValidations.emailValidator,
          ),
          EduconnectTextField(
            labelText: EduconnectConstants.localization().enter_phone_number,
            focusNode: phoneFocusNode,
            validator: EduconnectValidations.phoneNumberValidator,
          ),
        ],
      ),
    );
  }
}
