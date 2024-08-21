import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ContainerUI extends StatelessWidget {
  Color color;
  double radius;
  Widget child;
  double childMargin;
  double containerMargin;

  ContainerUI(
      {super.key,
      required this.child,
      this.containerMargin = 5,
      this.color = Colors.grey,
      this.radius = 10,
      this.childMargin = 5});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(containerMargin),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Container(
          margin: EdgeInsets.all(childMargin), child: Center(child: child)),
    );
  }
}
