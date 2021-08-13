part of validation;

Validation _postalCodeUtils(String postalcode) {
  if (postalcode.isEmpty) {
    return _result(false, Messages.emptyPostalCode);
  } else {
    // final bool phoneValid = RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(phoneNumber);
    if (postalcode.length >= 4 && (_isAllUpperCase(postalcode) || _isNumeric(postalcode))) {
      return _result(true, Messages.validPostalCode);
    } else {
      return _result(false, Messages.invalidPostalCode);
    }
  }
}
