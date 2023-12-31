import 'educonnect_constants.dart';

class EduconnectValidations {
  // String? Function(String?)?
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return EduconnectConstants.localization().email_validation_error;
    } else if (!RegExp(
            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+[.com]") //remove the[] in .com
        .hasMatch(value)) {
      return EduconnectConstants.localization().email_invalid_error;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return EduconnectConstants.localization().password_validation_error;
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return EduconnectConstants.localization().phone_number_validation_error;
    }
    if (value.length != 11) {
      return EduconnectConstants.localization().phone_number_validation_error;
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return EduconnectConstants.localization().name_validation_error;
    }
    return null;
  }
}
