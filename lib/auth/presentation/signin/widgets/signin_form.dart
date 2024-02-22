import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/common_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/common_features/widgets/educonnect_checkbox.dart';
import '../../../../../common/common_features/widgets/fields/educonnect_password_field.dart';
import '../../../../../common/common_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/common_features/responsive/responsive.dart';
import '../../../../../common/style/educonnect_colors.dart';
import '../../../logic/cubit/auth_cubit.dart';

class SigninForm extends StatefulWidget {
  final Function(bool) onIsKeyboardOpenChanged;
  // final Function(bool isButtonDisabled) onFormChanged;
  //final FocusNode focusNode;
  const SigninForm({
    super.key,
    required this.onIsKeyboardOpenChanged,
    // required this.onFormChanged,
  });

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isKeyboardOpen = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool _isButtonDisabled = true;
  String inputEmail = '';
  String inputPassword = '';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        setState(() {
          _isButtonDisabled = !_formKey.currentState!.validate();
          // widget.onFormChanged(_isButtonDisabled);
        });
      },
      child: Column(
        children: [
          IschoolerTextField(
            initialValue: 'ziad@test.com',
            labelText: IschoolerConstants.localization().enter_email,
            validator: IschoolerValidations.emailValidator,
            suffixIcon: const Icon(Icons.person),
            focusNode: emailFocusNode,
            onSaved: (value) {
              if (value != null) {
                inputEmail = value;
              }
            },
          ),
          IschoolerPasswordField(
            initialValue: 'password',
            labelText: IschoolerConstants.localization().enter_password,
            validator: IschoolerValidations.passwordValidator,
            focusNode: passwordFocusNode,
            onSaved: (value) {
              if (value != null) {
                inputPassword = value;
              }
            },
          ),

          /// shows the row that contains the remember me checkbex
          ///  and forgot pasword button
          forgotPasswordRow(),
          SizedBox(height: 20.h),
          // sign in button
          IschoolerButton(
            button: IschoolerElevatedButton(
              // disabled: _isButtonDisabled,
              onPressed: onSigninButtonPressed,
              text: IschoolerConstants.localization().sign_in,
            ),
          ),
        ],
      ),
    );
  }

  onSigninButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context
          .read<AuthCubit>()
          .signIn(email: inputEmail, password: inputPassword);
    }
  }

  Row forgotPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: Responsive.expandedChildren(
        children: [
          IschoolerCheckbox(
            text: IschoolerConstants.localization().remember_me,
            onChanged: (isSelected) {},
          ),
          IschoolerButton(
            button: IschoolerTextButton(
              onPressed: () {},
              textButton: IschoolerConstants.localization().forgot_password,
              color: IschoolerColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
