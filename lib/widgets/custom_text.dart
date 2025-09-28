import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const CustomText({
    super.key,
    required this.data,
    this.fontSize = 20,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
    );
  }
}
