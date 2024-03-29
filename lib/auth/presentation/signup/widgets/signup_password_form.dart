import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/common_features/widgets/buttons/ischooler_button_export.dart';
import '../../../../../common/common_features/widgets/fields/ischooler_password_field.dart';
import '../../../../../common/ischooler_constants.dart';
import '../../../../../common/ischooler_validation.dart';
import '../../../../admin_features/users/user_model.dart';
import '../../../logic/cubit/auth_cubit.dart';

class SignupPasswordForm extends StatefulWidget {
  final Function(bool) onIsKeyboardStatusChanged;
  final UserModel newUser;
  const SignupPasswordForm({
    super.key,
    required this.onIsKeyboardStatusChanged,
    required this.newUser,
  });

  @override
  State<SignupPasswordForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupPasswordForm> {
  bool isKeyboardOpen = false;
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  // bool _isButtonDisabled = true;

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
      /* onChanged: () {
        setState(() {
          _isButtonDisabled = !_formKey.currentState!.validate();
        });
      }, */
      child: Column(
        children: [
          IschoolerPasswordField(
            initialValue: 'password',
            labelText: IschoolerConstants.localization().enter_password,
            focusNode: passwordFocusNode,
            validator: IschoolerValidations.passwordValidator,
          ),
          IschoolerPasswordField(
            initialValue: 'password',
            labelText: IschoolerConstants.localization().confirm_password,
            focusNode: confirmPasswordFocusNode,
            validator: IschoolerValidations.passwordValidator,
          ),
          SizedBox(height: 20.h),
          IschoolerButton(
            button: IschoolerElevatedButton(
              // disabled: _isButtonDisabled,
              onPressed: onSignupButtonPressed,
              text: IschoolerConstants.localization().sign_up,
            ),
          ),
        ],
      ),
    );
  }

  onSignupButtonPressed() {
    context
        .read<AuthCubit>()
        .signUp(user: widget.newUser, password: 'password');
  }
}
