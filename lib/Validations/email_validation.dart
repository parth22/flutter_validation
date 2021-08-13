part of validation;

Validation _emailValidationUtils(String email) {
  if (email.isEmpty) {
    return _result(false, Messages.emailEmpty);
  } else {
    final String data = email.trim();
    final RegExp _regExp1 = RegExp(_Regex.email1);
    final RegExp _regExp2 = RegExp(_Regex.email2);
    final RegExp _regExp3 = RegExp(_Regex.email3);
    final RegExp _regExp4 = RegExp(_Regex.email4);

    if (_regExp1.hasMatch(data) &&
        _regExp2.hasMatch(data) &&
        _regExp3.hasMatch(data) &&
        _regExp4.hasMatch(data)) {
      return _result(true, Messages.validEmail);
    } else {
      return _result(false, Messages.invalidEmail);
    }
  }
}
