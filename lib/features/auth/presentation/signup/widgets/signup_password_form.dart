import 'package:flutter/material.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/features/widgets/fields/educonnect_password_field.dart';

class SignupPasswordForm extends StatefulWidget {
  final Function(bool) onIsKeyboardStatusChanged;
  final Function(bool isButtonDisabled) onFormChanged;

  const SignupPasswordForm(
      {super.key,
      required this.onIsKeyboardStatusChanged,
      required this.onFormChanged});

  @override
  State<SignupPasswordForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupPasswordForm> {
  bool isKeyboardOpen = false;
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  bool _isButtonDisabled = true;

  void _updateIsKeyboardOpen(bool newValue) {
    widget.onIsKeyboardStatusChanged(newValue);
  }

  @override
  void initState() {
    super.initState();

    passwordFocusNode.addListener(() {
      _updateIsKeyboardOpen(passwordFocusNode.hasFocus);
    });

    confirmPasswordFocusNode.addListener(() {
      _updateIsKeyboardOpen(confirmPasswordFocusNode.hasFocus);
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
          EduconnectPasswordField(
            labelText: EduconnectConstants.localization().enter_password,
            focusNode: passwordFocusNode,
            validator: EduconnectValidations.emailValidator,
          ),
          EduconnectPasswordField(
            labelText: EduconnectConstants.localization().confirm_password,
            focusNode: confirmPasswordFocusNode,
            validator: EduconnectValidations.nameValidator,
          ),
        ],
      ),
    );
  }
}
