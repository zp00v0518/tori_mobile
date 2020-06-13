import './global_validator.dart';

class InputValidator {
  InputValidator({this.error = '', this.steps});
  final String error;
  final List<Function> steps;

  String email(value) {
    final globalValidator = GlobalValidator();
    bool result = globalValidator.email(value);
    String err = error != '' ? error : "This is not email";
    return result ? null : err;
  }

   String require(value) {
    String err = error != '' ? error : "This field is required";
    return value != '' ? null : err;
  }

  String stepByStep(value) {
    String result;
    for (var element in steps) {
      result = element(value);
      if (result != null) break;
    }
    return result;
  }
}
