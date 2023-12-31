import 'package:flutter/material.dart';
import 'package:school_admin/common/educonnect_validation.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/features/widgets/fields/educonnect_password_field.dart';
import '../../../../../common/features/widgets/fields/educonnect_text_field.dart';

class SigninForm extends StatefulWidget {
  final Function(bool) onIsKeyboardOpenChanged;
  final Function(bool isButtonDisabled) onFormChanged;
  //final FocusNode focusNode;
  const SigninForm({
    super.key,
    required this.onIsKeyboardOpenChanged,
    required this.onFormChanged,
  });

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  bool isKeyboardOpen = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool _isButtonDisabled = true;

  void _updateIsKeyboardOpen(bool newValue) {
    widget.onIsKeyboardOpenChanged(newValue);
  }

  @override
  void initState() {
    super.initState();

    // Add a listener to the focus node to detect changes in focus
    emailFocusNode.addListener(() {
      setState(() {
        // Update the state based on whether the keyboard is open or closed
        isKeyboardOpen = emailFocusNode.hasFocus;
        _updateIsKeyboardOpen(isKeyboardOpen);
      });
    });

    passwordFocusNode.addListener(() {
      setState(() {
        // Update the state based on whether the keyboard is open or closed
        isKeyboardOpen = passwordFocusNode.hasFocus;
        _updateIsKeyboardOpen(isKeyboardOpen);
      });
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
            labelText: EduconnectConstants.localization().enter_email,
            validator: EduconnectValidations.emailValidator,
            suffixIcon: const Icon(Icons.person),
            focusNode: emailFocusNode,
          ),
          EduconnectPasswordField(
            labelText: EduconnectConstants.localization().enter_password,
            validator: EduconnectValidations.passwordValidator,
            focusNode: passwordFocusNode,
          )
        ],
      ),
    );
  }
}
