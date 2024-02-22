import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../common/common_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/common_features/widgets/educonnect_checkbox.dart';
import '../../../../../common/common_features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/style/educonnect_text_theme.dart';
import '../../../../admin_features/users/user_model.dart';
import '../../../../common/navigation/router.export.dart';
import '../../../logic/cubit/auth_cubit.dart';

class SignupForm extends StatefulWidget {
  final Function(bool) onIsKeyboardStatusChanged;

  const SignupForm({
    super.key,
    required this.onIsKeyboardStatusChanged,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isKeyboardOpen = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  // bool _isButtonDisabled = true;
  bool _isCheckboxChecked = false;
  UserModel newUser = UserModel.empty();

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
      /*   onChanged: () {
        setState(() {
          _isButtonDisabled = !_formKey.currentState!.validate();
        });
      }, */
      child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!(state.user.role == UserRole.admin))
              IschoolerTextField(
                // initialValue: 'ziad',
                labelText: 'Enrollment code',
                focusNode: nameFocusNode,
                validator: IschoolerValidations.nameValidator,
                onSaved: (String? value) =>
                    newUser = newUser.copyWith(name: value),
              ),
            if ((state.user.role == UserRole.admin))
              IschoolerTextField(
                initialValue: 'ziad',
                labelText: IschoolerConstants.localization().enter_name,
                focusNode: nameFocusNode,
                validator: IschoolerValidations.nameValidator,
                onSaved: (String? value) =>
                    newUser = newUser.copyWith(name: value),
              ),
            if ((state.user.role == UserRole.admin))
              IschoolerTextField(
                initialValue: 'ziad@test.com',
                labelText: IschoolerConstants.localization().enter_email,
                focusNode: emailFocusNode,
                validator: IschoolerValidations.emailValidator,
                onSaved: (String? value) =>
                    newUser = newUser.copyWith(email: value),
              ),
            if ((state.user.role == UserRole.admin))
              IschoolerTextField(
                initialValue: '01112345671',
                labelText: IschoolerConstants.localization().enter_phone_number,
                focusNode: phoneFocusNode,
                validator: IschoolerValidations.phoneNumberValidator,
                onSaved: (String? value) =>
                    newUser = newUser.copyWith(phoneNumber: value),
              ),
            IschoolerCheckbox(
              text:
                  'I agree with the terms and conditions and also the protection of my presonal data on thi applicaiton',
              textStyle: IschoolerTextStyles.style10Grey,
              onChanged: onAgrementChecked,
            ),
            IschoolerButton(
              button: IschoolerElevatedButton(
                // disabled: _isButtonDisabled || !_isCheckboxChecked,
                onPressed: onNextButtonPressed,
                text: IschoolerConstants.localization().next,
              ),
            ),
          ],
        );
      }),
    );
  }

  onAgrementChecked(bool isSelected) {
    setState(() {
      _isCheckboxChecked = isSelected;
    });
  }

  onNextButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_isCheckboxChecked) {
        // IschoolerNavigator.navigateToScreen(
        // SignupPasswordScreen(newUser: newUser));
        IschoolerNavigator.push(
          Routes.signupPasswordScreen,
          arguments: newUser,
        );
      } else {
        SmartDialog.showToast(
            IschoolerConstants.localization().accept_the_terms_and_conditions);
      }
    }
  }
}
