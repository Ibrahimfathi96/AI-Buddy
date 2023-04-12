import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const TextWidget(
      {super.key,
      required this.label,
      this.fontSize = 18,
      this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
