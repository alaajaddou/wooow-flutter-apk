import 'package:email_validator/email_validator.dart' show EmailValidator;

class Validators {
  static validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'لابد من ادخال البريد الالكتروني';
    }

    if (!EmailValidator.validate(email)) {
      return 'الرجاء ادخال بريد الكتروني صحيح';
    }

    return null;
  }

  static validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'لابد من ادخال كلمة المرور';
    }
    return null;
  }

  static validateName(String? name) {
    if(name == null || name.isEmpty) {
      return "لابد من ادخال الاسم";
    }
    return null;
  }

  static validatePasswordConfirmation(String? passwordConfirmation, String? password) {
    String? passwordConfirmationValidation = Validators.validatePassword(passwordConfirmation);
    if (passwordConfirmationValidation == null) {
      if (password != passwordConfirmation) {
        return "لابد ان تتطابق مع كلمة المرور";
      }
      return null;
    } else {
      return passwordConfirmationValidation;
    }
  }
}