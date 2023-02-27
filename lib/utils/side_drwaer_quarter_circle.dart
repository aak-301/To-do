import 'package:flutter/material.dart';

class SideDrawerQuarterCircle extends StatelessWidget {
  const SideDrawerQuarterCircle(
      {required this.radius, required this.color, super.key});

  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(radius),
        ),
      ),
    );
  }
}
