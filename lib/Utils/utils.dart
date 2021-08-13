part of validation;

bool _isUpperCase(String value) {
  bool _isUpper = false;
  for (int _ascii in value.codeUnits) {
    if (_ascii >= 65 && _ascii <= 90) {
      _isUpper = true;
      break;
    } else {
      _isUpper = false;
    }
  }

  return _isUpper;
}

bool _isAllUpperCase(String value) {
  bool _isUpper = false;
  for (int _ascii in value.codeUnits) {
    if (_ascii >= 65 && _ascii <= 90) {
      _isUpper = true;
    } else {
      _isUpper = false;
      break;
    }
  }

  return _isUpper;
}

bool _isLowerCase(String value) {
  bool _isLower = false;
  for (int _ascii in value.codeUnits) {
    if (_ascii >= 97 && _ascii <= 122) {
      _isLower = true;
      break;
    } else {
      _isLower = false;
    }
  }

  return _isLower;
}

bool _isNumeric(String value) {
  bool _isNumeric = false;
  for (int _ascii in value.codeUnits) {
    if (_ascii >= 48 && _ascii <= 57) {
      _isNumeric = true;
      break;
    } else {
      _isNumeric = false;
    }
  }

  return _isNumeric;
}

bool _isSpacialChar(String value) {
  bool _isSpacialChar = false;
  for (int _ascii in value.codeUnits) {
    if (_ascii >= 32 && _ascii <= 47 ||
        _ascii >= 58 && _ascii <= 64 ||
        _ascii >= 91 && _ascii <= 96 ||
        _ascii >= 123 && _ascii <= 126) {
      _isSpacialChar = true;
      break;
    } else {
      _isSpacialChar = false;
    }
  }

  return _isSpacialChar;
}

// List of conditions
List<bool> conditions(value) => [
      _isUpperCase(value),
      _isLowerCase(value),
      _isNumeric(value),
      _isSpacialChar(value),
    ];

// cases list, it will help us to identufy which case user selected in List
final List<PasswordCase> _cases = [
  PasswordCase.UPPERCASE,
  PasswordCase.LOWERCASE,
  PasswordCase.NUMERIC,
  PasswordCase.SPACIALCHARACTER
];

Validation _result(bool isValidate, String message) {
  final Map<String, dynamic> _data = {
    'isValidate': isValidate,
    'message': message,
  };
  return Validation.fromJson(_data);
}
