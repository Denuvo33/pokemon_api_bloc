import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextTitle extends StatelessWidget {
  String text;
  Color color;
  double size;
  FontWeight fontWeight;
  TextTitle(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.bold,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
    );
  }
}
