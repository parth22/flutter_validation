part of validation;

Validation _passwordValidationUtils(
    String password, List<PasswordCase> passwordCase, int wordLimit) {
  final bool passwordRange = password.trim().length >= wordLimit;
  final List<PasswordCase> caseList = [];

  // removing duplicate object
  if (passwordCase != null) {
    for (PasswordCase _case in passwordCase) {
      if (!caseList.contains(_case)) {
        caseList.add(_case);
      }
    }
    passwordCase = caseList;
  }

  switch (password.isEmpty) {
    case true:
      return _result(false, Messages.emptyPassword);
    default:
      switch (passwordCase) {
        case null:
          return _allCaseValidation(password, passwordRange);
        default:
          return _isCustomValidation(password, passwordCase, passwordRange);
      }
  }
}

Validation _isCustomValidation(
    String password, List<PasswordCase> passwordCase, bool passwordRange) {
  switch (passwordCase.isEmpty) {
    case true:
      return _isPasswordEmpty(passwordRange);
    default:
      switch (passwordCase.length) {
        case 1:
          return _oneCaseValidation(password, passwordCase, passwordRange);
        case 2:
          return _twoCaseValidation(password, passwordCase, passwordRange);
        case 3:
          return _threeCaseValidation(password, passwordCase, passwordRange);
        default:
          return _fourthCaseValidation(password, passwordCase, passwordRange);
      }
  }
}

Validation _isPasswordEmpty(bool passwordRange) {
  switch (passwordRange) {
    case true:
      return _result(true, Messages.validPassword);
    default:
      return _result(false, Messages.invalidPassword);
  }
}

Validation _allCaseValidation(String password, bool passwordRange) {
  if (conditions(password)[0] &&
      conditions(password)[1] &&
      conditions(password)[2] &&
      conditions(password)[3] &&
      passwordRange) {
    return _result(true, Messages.validPassword);
  } else {
    return _result(false, Messages.invalidPassword);
  }
}

Validation _oneCaseValidation(
    String password, List<PasswordCase> passwordCase, bool passwordRange) {
  final int _index = _cases.indexOf(passwordCase[0]);
  if (conditions(password)[_index] && passwordRange) {
    return _result(true, Messages.validPassword);
  } else {
    return _result(false, Messages.invalidPassword);
  }
}

Validation _twoCaseValidation(
    String password, List<PasswordCase> passwordCase, bool passwordRange) {
  final int _indexOne = _cases.indexOf(passwordCase[0]);
  final int _indexTwo = _cases.indexOf(passwordCase[1]);
  if (conditions(password)[_indexOne] && conditions(password)[_indexTwo] && passwordRange) {
    return _result(true, Messages.validPassword);
  } else {
    return _result(false, Messages.invalidPassword);
  }
}

Validation _threeCaseValidation(
    String password, List<PasswordCase> passwordCase, bool passwordRange) {
  final int _indexOne = _cases.indexOf(passwordCase[0]);
  final int _indexTwo = _cases.indexOf(passwordCase[1]);
  final int _indexThree = _cases.indexOf(passwordCase[2]);
  if (conditions(password)[_indexOne] &&
      conditions(password)[_indexTwo] &&
      conditions(password)[_indexThree] &&
      passwordRange) {
    return _result(true, Messages.validPassword);
  } else {
    return _result(false, Messages.invalidPassword);
  }
}

Validation _fourthCaseValidation(
    String password, List<PasswordCase> passwordCase, bool passwordRange) {
  final int _indexOne = _cases.indexOf(passwordCase[0]);
  final int _indexTwo = _cases.indexOf(passwordCase[1]);
  final int _indexThree = _cases.indexOf(passwordCase[2]);
  final int _indexFour = _cases.indexOf(passwordCase[3]);
  if (conditions(password)[_indexOne] &&
      conditions(password)[_indexTwo] &&
      conditions(password)[_indexThree] &&
      conditions(password)[_indexFour] &&
      passwordRange) {
    return _result(true, Messages.validPassword);
  } else {
    return _result(false, Messages.invalidPassword);
  }
}
