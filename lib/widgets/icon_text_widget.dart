import 'package:ecommerce_app/utlis/constant_colors.dart';
import 'package:ecommerce_app/widgets/smalltext_widget.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  const IconTextWidget({super.key, required this.text, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon( icon,
          color: color,
        ),
        SmallText(text: text),
      ],
    );
  }
}
