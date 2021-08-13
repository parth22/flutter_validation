part of validation;

class Validation {
  Validation({this.isValidate, this.message}) : assert(message != null && isValidate != null);

  Validation.fromJson(Map<String, dynamic> json) {
    isValidate = json['isValidate'];
    message = json['message'];
  }

  bool isValidate;
  String message;
}
