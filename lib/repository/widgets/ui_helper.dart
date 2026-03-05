import 'package:flutter/material.dart';

class UiHelper {
  static customText({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  static customTextButton({
    required String text,
    required VoidCallback onPressed,
    Color? color = Colors.black,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextButton(onPressed: onPressed, child: Text(text,style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color
    ),));
  }
}
