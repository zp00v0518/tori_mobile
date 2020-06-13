import './patterns.dart';

class GlobalValidator {
  bool email(value) {
    Pattern pattern = patterns['email'];
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }
  bool require(value) {
    Pattern pattern = patterns['require'];
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }
}
