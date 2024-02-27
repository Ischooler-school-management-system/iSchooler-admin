import 'ischooler_constants.dart';

class IschoolerValidations {
  // String? Function(String?)?
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return IschoolerConstants.localization().email_validation_error;
    } else if (!RegExp(
            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+[.com]") //remove the[] in .com
        .hasMatch(value)) {
      return IschoolerConstants.localization().email_invalid_error;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return IschoolerConstants.localization().password_validation_error;
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return IschoolerConstants.localization().phone_number_validation_error;
    }
    if (value.length != 11) {
      return IschoolerConstants.localization().phone_number_validation_error;
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return IschoolerConstants.localization().name_validation_error;
    }
    return null;
  }
}
