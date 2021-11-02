import 'package:email_validator/email_validator.dart' show EmailValidator;

class Validators {
  validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'لابد من ادخال البريد الالكتروني';
    }

    if (!EmailValidator.validate(email)) {
      return 'الرجاء ادخال بريد الكتروني صحيح';
    }

    return null;
  }

  validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'لابد من ادخال كلمة المرور';
    }
    return null;
  }
}