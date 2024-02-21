import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/common_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/common_features/widgets/fields/educonnect_password_field.dart';
import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/educonnect_validation.dart';
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
          EduconnectPasswordField(
            initialValue: 'password',
            labelText: EduconnectConstants.localization().enter_password,
            focusNode: passwordFocusNode,
            validator: EduconnectValidations.passwordValidator,
          ),
          EduconnectPasswordField(
            initialValue: 'password',
            labelText: EduconnectConstants.localization().confirm_password,
            focusNode: confirmPasswordFocusNode,
            validator: EduconnectValidations.passwordValidator,
          ),
          SizedBox(height: 20.h),
          EduconnectButton(
            button: EduconnectElevatedButton(
              // disabled: _isButtonDisabled,
              onPressed: onSignupButtonPressed,
              text: EduconnectConstants.localization().sign_up,
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
