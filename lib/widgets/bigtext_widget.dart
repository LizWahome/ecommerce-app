import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  TextOverflow overflow;
  final bool fontWeight;
  double size;
  BigText(
      {super.key,
      this.color = const Color(0xFF133337),
      required this.text,
      this.size = 20,
      this.overflow = TextOverflow.ellipsis,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight == true ? FontWeight.w400 : FontWeight.bold,
          fontSize: size),
    );
  }
}
