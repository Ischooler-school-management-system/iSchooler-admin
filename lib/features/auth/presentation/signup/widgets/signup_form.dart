import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../common/educonnect_constants.dart';
import '../../../../../common/educonnect_validation.dart';
import '../../../../../common/features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/features/widgets/educonnect_checkbox.dart';
import '../../../../../common/features/widgets/fields/educonnect_text_field.dart';
import '../../../../../common/navigation/educonnect_navi.dart';
import '../../../../../common/style/educonnect_text_theme.dart';
import '../../../../users/user_model.dart';
import '../screens/sign_up_password_screen.dart';

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
      child: Column(
        children: [
          EduconnectTextField(
            initialValue: 'ziad',
            labelText: EduconnectConstants.localization().enter_name,
            focusNode: nameFocusNode,
            validator: EduconnectValidations.nameValidator,
            onSaved: (String? value) =>
                newUser = newUser.copyWith(displayName: value, userName: value),
          ),
          EduconnectTextField(
            initialValue: 'ziad@test.com',
            labelText: EduconnectConstants.localization().enter_email,
            focusNode: emailFocusNode,
            validator: EduconnectValidations.emailValidator,
            onSaved: (String? value) =>
                newUser = newUser.copyWith(email: value),
          ),
          EduconnectTextField(
            initialValue: '01112345671',
            labelText: EduconnectConstants.localization().enter_phone_number,
            focusNode: phoneFocusNode,
            validator: EduconnectValidations.phoneNumberValidator,
            onSaved: (String? value) =>
                newUser = newUser.copyWith(phoneNumber: value),
          ),
          EduconnectCheckbox(
            text:
                'I agree with the terms and conditions and also the protection of my presonal data on thi applicaiton',
            textStyle: EduconnectTextStyles.style10Grey,
            onChanged: onAgrementChecked,
          ),
          EduconnectButton(
            button: EduconnectElevatedButton(
              // disabled: _isButtonDisabled || !_isCheckboxChecked,
              onPressed: onNextButtonPressed,
              text: EduconnectConstants.localization().next,
            ),
          ),
        ],
      ),
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
        EduconnectNavigator.navigateToScreen(
            SignupPasswordScreen(newUser: newUser));
      } else {
        SmartDialog.showToast(
            EduconnectConstants.localization().accept_the_terms_and_conditions);
      }
    }
  }
}
