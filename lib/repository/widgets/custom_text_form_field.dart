import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  double? height;
  double width;
  Color? bgColor;
  BorderRadius? borderRadius;
  TextEditingController controller;
  String hintText;
  bool obscureText;

  String? Function(String?)? validator;

  CustomTextFormField({
    super.key,
    this.height,
    this.width = 275,
    this.bgColor,
    this.borderRadius,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validator,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: bgColor, borderRadius: borderRadius),
      child: Center(
        child: TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }
}
