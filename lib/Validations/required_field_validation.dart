part of validation;

Validation _requiredFieldUtils(String value) {
  if (value.isEmpty) {
    return _result(false, Messages.fieldEmpty);
  } else {
    return _result(true, Messages.ok);
  }
}
