import 'package:jr_case_boilerplate/gen/strings.g.dart';

mixin ValidatorsMixin {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return t.validation.email_required;
    }
    const emailPattern =
        r"^[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.)*[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.[a-zA-Z0-9]{2,}$";
    final regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return t.validation.invalid_email;
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return t.validation.name_required;
    }
    if (value.length < 3) {
      return t.validation.name_min_length;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return t.validation.password_required;
    }
    if (value.length < 6) {
      return t.validation.password_min_length;
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return t.validation.confirm_password_required;
    }
    if (value != password) {
      return t.validation.passwords_do_not_match;
    }
    return null;
  }
}
