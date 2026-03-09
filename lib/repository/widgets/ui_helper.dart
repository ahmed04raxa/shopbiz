import 'package:flutter/material.dart';

class UiHelper {
  static customText({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    TextAlign? textAlign,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily ?? "regular",
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
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }

  static customImage({
    required String imgUrl,
    double? width,
    double? height,
    BoxFit? boxFit,
  }) {
    return Image.asset(
      "assets/images/$imgUrl",
      width: width,
      height: height,
      fit: boxFit,
    );
  }
}
