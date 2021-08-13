library validation;

part 'Constant/messages.dart';
part 'Model/validation_model.dart';
part 'Utils/utils.dart';
part 'Validations/username_validation.dart';
part 'Validations/required_field_validation.dart';
part 'Validations/postalcode_validation.dart';
part 'Validations/phone_validation.dart';
part 'Validations/password_validation.dart';
part 'Validations/email_validation.dart';
part 'Constant/regex.dart';

enum PasswordCase { UPPERCASE, LOWERCASE, NUMERIC, SPACIALCHARACTER }

class Validator {
  /// Username validation, Here username validation using below regex
  /// r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$'
  /// Which contain lowercase and capitals, alphanumeric characters,
  /// underscore and hyphens and spaces, two hypens or two spaces in a row,
  /// hypen or space at the start or end.
  static Validation usernameValidation(String username) => _userNameValidationUtil(username);

  /// Email validation, Here email validation using below regex
  ///
  /// r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  static Validation emailValidation(String email) => _emailValidationUtils(email);

  /// Password validtion, Here [passwordCase] and [wordLimit] both are
  /// optional parameter. If you leave [passwordCase] as a empty list then it will
  /// consider only [wordLimit] as a part of validation.
  ///
  /// If you leave [passwordCase] null or
  /// haven't defininig any value then it will consider as strong validation with all
  /// validation method.
  ///
  /// If you give [passwordCase] value like [PasswordCase.UPPERCASE,PasswordCase.NUMERIC]
  /// then it will consider these two validation method only to validate your string.
  static Validation passwordValidation(String password,
          {List<PasswordCase> passwordCase, int wordLimit = 6}) =>
      _passwordValidationUtils(password, passwordCase, wordLimit);

  /// Postal code or Zipcode validation, Here postal code should be greater then or equal to 4 and
  /// if there is any alphabate avilable then it should be capitalize.
  static Validation postalcodeValidation(String postalcode) => _postalCodeUtils(postalcode);

  /// Phone number validation, Here phone validation using below regex
  ///
  /// r'^(?:[+0][1-9])?[0-9]{10,12}$'
  static Validation phoneValidation(String phone) => _phoneValidationUtils(phone);

  ///To validate required field.
  String requiredField(String value) {
    if (value.isEmpty) {
      return Messages.fieldEmpty;
    } else {
      return Messages.ok;
    }
  }

  /// Required filed validation, Here we are checking if feild has null or emply or has any value.
  static Validation requiredFiledValidation(String value) => _requiredFieldUtils(value);
}
