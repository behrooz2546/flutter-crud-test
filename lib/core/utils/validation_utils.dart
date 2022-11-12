import 'package:email_validator/email_validator.dart';
import 'package:libphonenumber/libphonenumber.dart';

class ValidationUtils {
  static Future<bool> isValidPhoneNumber(String phoneNumber) async {
    final valid = await PhoneNumberUtil.isValidPhoneNumber(
        phoneNumber: phoneNumber, isoCode: 'US');

    if (valid == null) return false;
    return valid;
  }

  static isValidEmail(String emailAddress) {
    return EmailValidator.validate(emailAddress);
  }
}
