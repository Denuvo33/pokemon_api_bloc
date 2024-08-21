import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextSubDetails extends StatelessWidget {
  String text;
  Color color;
  double size;
  FontWeight fontWeight = FontWeight.normal;
  TextSubDetails(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.size = 14,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }
}
