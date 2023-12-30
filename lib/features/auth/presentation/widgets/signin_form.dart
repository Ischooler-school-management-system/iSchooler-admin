import 'package:flutter/material.dart';

import '../../../../common/educonnect_constants.dart';
import '../../../../common/features/widgets/fields/educonnect_password_field.dart';
import '../../../../common/features/widgets/fields/educonnect_text_field.dart';

class SigninForm extends StatefulWidget {
  final Function(bool) onIsKeyboardOpenChanged;
  //final FocusNode focusNode;
  const SigninForm({super.key, required this.onIsKeyboardOpenChanged});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  bool isKeyboardOpen = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

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
      child:  Column(
        children: [
          EduconnectTextField(
            labelText: EduconnectConstants.localization().enter_email,
            suffixIcon: const Icon(Icons.person),
            focusNode: emailFocusNode,
          ),
          EduconnectPasswordField(
            labelText: EduconnectConstants.localization().enter_password,
            focusNode: passwordFocusNode,
          )
        ],
      ),
    );
  }
}
