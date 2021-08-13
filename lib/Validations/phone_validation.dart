part of validation;

///To validate phone number.
Validation _phoneValidationUtils(String phoneNumber) {
  if (phoneNumber.isEmpty) {
    return _result(false, Messages.emptyPhone);
  } else {
    final bool phoneValid = RegExp(_Regex.phone).hasMatch(phoneNumber);
    if (phoneValid) {
      return _result(true, Messages.validPhone);
    } else {
      return _result(false, Messages.invalidPhone);
    }
  }
}
