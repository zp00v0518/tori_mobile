import 'package:flutter/material.dart';

Map listIcons = {
  'email': Icons.alternate_email,
  'password': Icons.lock_open,
};

class Input extends StatelessWidget {
  Input({this.placeholder = 'Input text', this.label, this.type, this.controller, this.validator});
  final String placeholder;
  final String label;
  final String type;
  final TextEditingController controller;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onEditingComplete: (){
        print('onEditingComplete');
      },
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 24.0),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText : label,
        hintText: placeholder,
        labelStyle: TextStyle(fontSize: 24.0),
        prefixIcon : Icon(listIcons[type]),
      ),
    );
  }
}

