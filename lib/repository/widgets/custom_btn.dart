import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  double? height = 300;
  double? width = 200;
  Color? bgColor = Colors.red;
  Color? color = Colors.black;
  VoidCallback callback;
  String text;
  double? fontSize = 12;
  FontWeight? fontWeight;

  CustomBtn({
    super.key,
    this.width,
    this.height,
    this.bgColor,
    required this.callback,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
