import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hinttext;
  final IconData icon;
  final Color iconColor;
  final bool obsuruceText;
  final TextEditingController textcontroller;

  MyTextField(
      {required this.icon,
      required this.iconColor,
      required this.hinttext,
      required this.obsuruceText,
      required this.textcontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textcontroller,
      obscureText: obsuruceText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          hintText: hinttext,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
