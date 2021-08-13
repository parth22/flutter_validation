part of validation;

Validation _userNameValidationUtil(String userName) {
  if (userName.isEmpty) {
    return _result(false, Messages.userNameEmpty);
  } else {
    final bool userNameValid = RegExp(_Regex.username).hasMatch(userName);
    if (userNameValid) {
      return _result(true, Messages.validUserName);
    } else {
      return _result(false, Messages.invalidUserName);
    }
  }
}
