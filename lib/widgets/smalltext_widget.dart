import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText(
      {super.key,
      required this.text,
      this.color = const Color(0xFF666666),
      this.size = 12,
      this.height = 1
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size, 
        color: color, 
        height: height
        ),
    );
  }
}
