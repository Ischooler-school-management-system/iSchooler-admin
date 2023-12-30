import 'package:flutter/material.dart';

import '../../../educonnect_constants.dart';
import 'educonnect_text_field.dart';

class EduconnectPasswordField extends StatefulWidget {
  final Function(String?)? onSaved;
  final String labelText;
  final String? initialValue;
  final FocusNode? focusNode;

  const EduconnectPasswordField({
    super.key,
    this.onSaved,
    required this.labelText,
    this.initialValue,
    this.focusNode,
  });

  @override
  State<EduconnectPasswordField> createState() =>
      _EduconnectPasswordFieldState();
}

class _EduconnectPasswordFieldState extends State<EduconnectPasswordField> {
  bool isHiddenPass = true;

  void _togglePass() {
    setState(() {
      isHiddenPass = !isHiddenPass;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EduconnectTextField(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      labelText: widget.labelText,
      textInputAction: TextInputAction.done,
      isObscureText: isHiddenPass,
      suffixIcon: InkWell(
        onTap: _togglePass,
        focusNode: widget.focusNode,
        child: isHiddenPass
            ? Icon(
                Icons.visibility_off,
                size: EduconnectConstants.educonnect_screen_height / 35,
              )
            : Icon(
                Icons.visibility,
                size: EduconnectConstants.educonnect_screen_height / 35,
              ),
      ),
      // validator: EduconnectValidations().passwordValidator,
      onSaved: widget.onSaved,
    );
  }
}
