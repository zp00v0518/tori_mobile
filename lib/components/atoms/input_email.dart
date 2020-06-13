import 'package:flutter/material.dart';
import './input.dart';
import '../../utils/validator/input_validator.dart';

class InputEmail extends StatefulWidget {
  final String label;
  final Function validator;

  InputEmail({this.label = "Email", this.validator});

  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Input(
        label: widget.label,
        type: 'email',
        validator: widget.validator != null
            ? widget.validator
            : InputValidator().email,
      ),
    );
  }
}
