import 'package:flutter/material.dart';

import '../../../../common/educonnect_constants.dart';
import '../../../../common/features/widgets/fields/educonnect_text_field.dart';

class SignupForm extends StatefulWidget {
  final Function(bool) onIsKeyboardStatusChanged;
  const SignupForm({super.key, required this.onIsKeyboardStatusChanged});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isKeyboardOpen = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();

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
      child: Column(
        children: [
          EduconnectTextField(
            labelText: EduconnectConstants.localization().enter_name,
            focusNode: nameFocusNode,
          ),
          EduconnectTextField(
            labelText: EduconnectConstants.localization().enter_email,
            focusNode: emailFocusNode,
          ),
          EduconnectTextField(
            labelText: EduconnectConstants.localization().enter_phone_number,
            focusNode: phoneFocusNode,
          ),
        ],
      ),
    );
  }
}
