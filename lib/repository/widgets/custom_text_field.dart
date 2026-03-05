import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  double height;
  double width;
  Color? bgColor;
  BorderRadius? borderRadius;
  TextEditingController controller;
  String hintText;
  bool obscureText = true;
  CustomTextField({
    super.key,
    this.height = 60,
    this.width = 275,
    this.bgColor,
    this.borderRadius,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: bgColor, borderRadius: borderRadius),
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 10)
        ),
      ),
    );
  }
}
