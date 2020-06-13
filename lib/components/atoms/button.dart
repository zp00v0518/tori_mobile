import 'package:flutter/material.dart';
import 'package:tori_mobile/styles/colors.dart';

class Button extends StatelessWidget {
  Button({this.label = "Click", this.onTap});
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: main_blue,
          border: Border.all(
            color: main_blue, //                   <--- border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(5.0) //         <--- border radius here
              ),
        ),
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
