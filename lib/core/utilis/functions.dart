import 'package:email_validator/email_validator.dart';
import 'package:wheater_app/core/utilis/app_strings.dart';

String? emailvaliation(String? email) {
  if (!EmailValidator.validate(email!)) return AppStrings.emailnotvalid;
  return null;
}

String? signinpaswordvaliation(String? password) {
  if (password!.isEmpty) return AppStrings.cantempty;
  return null;
}

String? passwordvaliation(String? password) {
  if (password!.length < 6) return AppStrings.cantlessthan6;
  return null;
}
