import 'package:flutter/material.dart';

import '../../../educonnect_constants.dart';
import 'educonnect_text_field.dart';

class IschoolerPasswordField extends StatefulWidget {
  final Function(String?)? onSaved;
  final String labelText;
  final String? Function(String?)? validator;

  final String? initialValue;
  final FocusNode? focusNode;

  const IschoolerPasswordField({
    super.key,
    this.onSaved,
    required this.labelText,
    this.initialValue,
    this.focusNode,
    this.validator,
  });

  @override
  State<IschoolerPasswordField> createState() => _IschoolerPasswordFieldState();
}

class _IschoolerPasswordFieldState extends State<IschoolerPasswordField> {
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
    return IschoolerTextField(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      labelText: widget.labelText,
      validator: widget.validator,
      textInputAction: TextInputAction.done,
      isObscureText: isHiddenPass,
      suffixIcon: InkWell(
        onTap: _togglePass,
        focusNode: widget.focusNode,
        child: isHiddenPass
            ? Icon(
                Icons.visibility_off,
                size: IschoolerConstants.educonnect_screen_height / 35,
              )
            : Icon(
                Icons.visibility,
                size: IschoolerConstants.educonnect_screen_height / 35,
              ),
      ),
      // validator: IschoolerValidations().passwordValidator,
      onSaved: widget.onSaved,
    );
  }
}
