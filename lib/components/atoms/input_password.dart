import 'package:flutter/material.dart';
import './input.dart';
import '../../utils/validator/input_validator.dart';

class InputPassword extends StatefulWidget {
  final String label;
  final Function validator;

  InputPassword({this.label = "Password", this.validator});

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

//TODO: сделать инпут для пароля https://stackoverflow.com/questions/49125064/how-to-show-hide-password-in-textformfield
class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Input(
        label: widget.label,
        type: 'password',
        validator: widget.validator != null
            ? widget.validator
            : InputValidator().require,
      ),
    );
  }
}
